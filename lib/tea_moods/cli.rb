
# CLI Controller
class TeaMoods::CLI

    def call
        puts "Available benefits: "
        list_moods
        menu
    end

    def list_moods
        @moods = TeaMoods::Mood.list
        @moods.each.with_index(1) do |mood, i|
            puts "#{i}. #{mood.name}"
        end
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter the number of a mood to view associated teas: "
            puts "(Otherwise, type 'list' to view list again or 'exit' to leave)"
            
            input = gets.strip
            is_number = (input == "#{input.to_i}")
            valid_number = (input.to_i > 0 && input.to_i <= @moods.length)

            if is_number && valid_number
                
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

    def goodbye
        puts "bye i guess"
    end
end

