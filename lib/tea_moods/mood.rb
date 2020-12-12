
class TeaMoods::Mood

    attr_accessor :name, :desc

    @@all = []

    def initialize(name, desc)
        self.name = name
        self.desc = desc
        save
    end

    def self.all
        @@all
    end

    def get_desc
        # TeaMoods::Scraper.scrape_mood_desc(self) if @desc.empty?
    end

    def get_teas
        # TeaMoods::Scraper.scrape_teas(self) if @teas.empty?
    end

    def teas
        TeaMoods::Tea.all.select {|tea| tea.mood == self}
    end

    def save
        @@all << self
    end
end