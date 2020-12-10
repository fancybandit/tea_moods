
class TeaMoods::Mood

    attr_accessor :name, :teas

    def self.list
        # puts "1. Relax"
        # puts "2. Focus"
        # puts "3. Good Mood"
        # puts "4. Energy"
        # puts "5. Detox"

        mood_1 = self.new
        mood_1.name = "Relax"
        mood_1.teas = "Oolong"

        mood_2 = self.new
        mood_2.name = "Focus"
        mood_2.teas = "Matcha"

        p [mood_1.name, mood_2.name]
    end
end