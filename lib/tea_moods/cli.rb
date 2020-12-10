
# CLI Controller
class TeaMoods::CLI

    def call
        puts "Select a desired benefit: "
        list_moods
    end

    def list_moods
        puts "Relax"
        puts "Focus"
        puts "Good Mood"
        puts "Energy"
        puts "Detox"
    end
end

