
# CLI Controller
class TeaMoods::CLI

    def call
        puts "Available benefits: "
        list_moods
        menu
    end

    def list_moods
        puts "1. Relax"
        puts "2. Focus"
        puts "3. Good Mood"
        puts "4. Energy"
        puts "5. Detox"
    end

    def menu
        
        input = nil
        while input != "exit"
            puts "Enter the number of a mood to view associated teas: "
            puts "(Otherwise, type 'list' to view list again or 'exit' to leave)"
            input = gets.strip
            case input
            when "1"
                puts "Tea list 1"
            when "2"
                puts "Tea list 2"
            when "list"
                list_moods
            when "exit"
                goodbye
            else
                puts "Not a valid number..."
            end
        end
    end

    def goodbye
        puts "bye i guess"
    end
end

