
class TeaMoods::Tea

    # A Tea has many moods
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

    # def add_to_mood
    #     @mood.teas << self unless @mood.teas.include?(self)
    # end

    def get_desc
        # TeaMoods::Scraper.scrape_tea_desc(self) if @desc.empty?
    end

end

