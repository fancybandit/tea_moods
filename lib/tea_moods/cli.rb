
# CLI Controller
class TeaMoods::CLI

    def call
        greeting
        get_moods
        list_moods
        menu
    end

    def get_moods
        @moods = TeaMoods::Mood.all
        TeaMoods::Scraper.scrape_moods if @moods.empty?
    end

    def list_moods
        puts "Available benefits: "
        @moods.each.with_index(1) do |mood, i|
            puts "#{i}. #{mood.name}"
        end
    end

    def get_teas(mood_choice)
        @teas = TeaMoods::Tea.all.select {|tea| tea.mood == mood_choice}
        TeaMoods::Scraper.scrape_teas(mood_choice) if @teas.empty?
    end

    def get_tea_desc(tea_choice)
        TeaMoods::Scraper.scrape_tea_desc(tea_choice) if tea_choice.desc == nil
    end

    def list_teas(mood_choice)
        puts mood_choice.desc
        get_teas(mood_choice)
        puts "Matching teas: "
        @teas.each.with_index(1) do |tea, i|
            puts "#{i}. #{tea.name}"
        end
    end

    def list_tea_desc(tea_choice)
        puts tea_choice.desc
    end

    def menu

        input = nil

        while input != "exit"

            puts "Enter the number of a mood/benefit to view associated teas: "
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

                        get_tea_desc(selected_tea)
                        list_tea_desc(selected_tea)
                    elsif input == "list"
                        list_teas(selected_mood)
                    elsif input == "back"
                        puts "Returning to mood list"
                        list_moods
                    elsif input == "exit"
                        goodbye
                    else
                        puts "Invalid input"
                    end
                end

            elsif input == "list"
                list_moods
            elsif input == "exit"
                goodbye
            else
                puts "Invalid input"
            end
        end
    end

    def is_number?(str)
        str == "#{str.to_i}"
    end

    def valid_choice?(input, data)
        input.to_i > 0 && input.to_i <= data.length
    end

    def greeting
        puts "Welcome to TeaMoods! The app that helps you select the perfect cup of tea from Traditonal Medicinals®"
    end

    def goodbye
        puts "Goodbye, take it easy."
    end
end

