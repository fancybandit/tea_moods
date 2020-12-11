
class TeaMoods::Mood

    attr_accessor :teas
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def self.list
        TeaMoods::Scraper.scrape_moods if @@all.empty?
    end

    def get_teas
        TeaMoods::Scraper.scrape_teas(self) if @teas.empty?
    end

    def save
        @@all << self
    end
end