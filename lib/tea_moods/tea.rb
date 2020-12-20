
class TeaMoods::Tea

    attr_accessor :name, :url, :moods, :desc

    @@all = []

    def initialize(name, url, mood)
        self.name = name
        self.url = url
        self.moods = []
        save_mood(mood)

        save
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def save_mood(mood)
        self.moods << mood
    end
end

