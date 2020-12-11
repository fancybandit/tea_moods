
class TeaMoods::Mood

    attr_accessor :name, :desc, :teas

    @@all = []

    def initialize(name)
        self.name = name

        save
    end

    def self.list
        TeaMoods::Scraper.scrape_moods if @@all.empty?
        @@all
    end

    def get_desc
        # TeaMoods::Scraper.scrape_mood_desc(self) if @desc.empty?
    end

    def get_teas
        # TeaMoods::Scraper.scrape_teas(self) if @teas.empty?
    end

    def save
        @@all << self
    end
end