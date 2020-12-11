
class TeaMoods::Tea

    attr_accessor :name, :url, :desc, :mood #, :nutrition_url

    @@all = []

    def initialize(name, url, mood)
        self.name = name
        self.url = url
        self.mood = mood
    end
end

