
# CLI Controller
class TeaMoods::CLI

    def call
        list_moods
        menu
    end

    def list_moods
        puts "Available benefits: "
        @moods = TeaMoods::Mood.list
        @moods.each.with_index(1) do |mood, i|
            puts "#{i}. #{mood.name}"
        end
    end

    def list_teas
        puts "Matching teas: "
        # @teas = TeaMoods::Tea
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter the number of a mood to view associated teas: "
            puts "(Otherwise, type 'list' to view list again or 'exit' to leave)"
            
            input = gets.strip

            if is_number?(input) && valid_choice?(input, @moods)
                # Program gets month of user's input

                # Create list_teas method that
                # works with a specified month

                # Also print the mood's description

                puts @moods[input.to_i-1].teas
            elsif input == "list"
                list_moods
            elsif input == "exit"
                puts "goodbye"
            else
                puts "Invalid input"
            end
        end
    end

    def is_number?(str)
        str == "#{str.to_i}"
    end

    def valid_choice?(input, data)
        input.to_i > 0 && input.to_i <= data.length)
    end

    def goodbye
        puts "bye i guess"
    end
end

