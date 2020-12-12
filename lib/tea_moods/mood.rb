
class TeaMoods::Mood

    # A Mood has many teas
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

    def save
        self.class.all << self
    end

    def get_desc
        # TeaMoods::Scraper.scrape_mood_desc(self) if @desc.empty?
    end

    # def teas
    #     TeaMoods::Tea.all.select {|tea| tea.mood == self}
    # end
end