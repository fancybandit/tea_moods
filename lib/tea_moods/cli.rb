
# CLI Controller
class TeaMoods::CLI

    def call
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

    def list_teas(mood_choice)
        get_teas(mood_choice)
        puts "Matching teas: "
        @teas.each.with_index(1) do |tea, i|
            puts "#{i}. #{tea.name}"
        end
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter the number of a mood to view associated teas: "
            puts "(Otherwise, type 'list' to view list again or 'exit' to leave)"
            
            input = gets.strip

            if is_number?(input) && valid_choice?(input, @moods)
                selected_mood = @moods[input.to_i-1]
                get_teas(selected_mood)
                list_teas(selected_mood)
                # Also print the mood's description
            elsif input == "list"
                list_moods
            elsif input == "exit"
                puts "goodbye"
            else
                puts "Invalid input"
            end
        end
    end

    # def input
    #     gets.strip
    # end

    def is_number?(str)
        str == "#{str.to_i}"
    end

    def valid_choice?(input, data)
        input.to_i > 0 && input.to_i <= data.length
    end

    def goodbye
        puts "bye i guess"
    end
end

