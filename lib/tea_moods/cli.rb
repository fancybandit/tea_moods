
class TeaMoods::CLI

    def call
        greeting
        get_moods
        list_moods
        menu
    end

    def greeting
        puts "\nWelcome to TeaMoods! The app that helps you select the perfect cup of tea from Traditonal Medicinals®\n\n"
    end

    def get_moods
        @moods = TeaMoods::Mood.all
        TeaMoods::Scraper.scrape_moods if @moods.empty?
    end

    def list_moods
        array_a = []
        array_b = []
        @moods.each.with_index(1) do |mood, i|
            if i <= ((@moods.length + 2) / 2)
                array_a << "#{i}. #{mood.name}"
            else
                array_b << "#{i}. #{mood.name}"
            end
        end
        table = TTY::Table.new(array_a.zip(array_b))
        puts TTY::Box.frame((table.render(:basic, resize: false)), width: TTY::Screen.width, title: {top_left: "Available benefits: "}, style: {bg: :bright_black}, padding: [1,0,0,0])
    end

    def get_teas(mood_choice)
        @teas = TeaMoods::Tea.all.select {|tea| tea.moods.include?(mood_choice)}
        TeaMoods::Scraper.scrape_teas(mood_choice) if @teas.empty?
    end

    def list_teas(mood_choice)
        puts "\n#{mood_choice.desc}\n\n"
        get_teas(mood_choice)
        table = []
        @teas.each.with_index(1) do |tea, i|
            table << "#{i}. #{tea.name}"
        end
        puts TTY::Box.frame(table.join("\n"), width: TTY::Screen.width, title: {top_left: "Matching teas: "}, style: {bg: :bright_black}, padding: [1,0,0,0])
    end

    def tea_desc(tea_choice)
        TeaMoods::Scraper.scrape_tea_desc(tea_choice) if tea_choice.desc == nil
        puts "\n#{tea_choice.desc}\n\n"
    end

    def is_number?(str)
        str == "#{str.to_i}"
    end

    def valid_choice?(input, data)
        input.to_i > 0 && input.to_i <= data.length
    end

    def goodbye
        puts "\nGoodbye, take it easy."
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter the number of a mood/condition to view associated teas: "
            puts "(Otherwise, type 'list' to view list again or 'exit' to leave)"
            
            input = gets.strip

            if is_number?(input) && valid_choice?(input, @moods)
                selected_mood = @moods[input.to_i-1]

                get_teas(selected_mood)
                list_teas(selected_mood)
                
                while (input != "back") && (input != "exit")
                    puts "Enter the number of a tea to view a description: "
                    puts "(Otherwise, type 'list' to view list again, 'back' to return to mood menu, or 'exit' to leave)"

                    input = gets.strip

                    if is_number?(input) && valid_choice?(input, @teas)
                        selected_tea = @teas[input.to_i-1]
                        tea_desc(selected_tea)
                    elsif input == "list"
                        list_teas(selected_mood)
                    elsif input == "back"
                        puts "\nReturning to mood list...\n\n"
                        list_moods
                    elsif input == "exit"
                        goodbye
                    else
                        puts "\nInvalid input\n\n"
                    end
                end

            elsif input == "list"
                list_moods
            elsif input == "exit"
                goodbye
            else
                puts "\nInvalid input\n\n"
            end
        end
    end
end

