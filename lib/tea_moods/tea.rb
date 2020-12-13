
class TeaMoods::Tea

    attr_accessor :name, :url, :mood, :desc #, :nutrition_url

    @@all = []

    def initialize(name, url, mood)
        self.name = name
        self.url = url
        self.mood = mood

        save
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end
end

