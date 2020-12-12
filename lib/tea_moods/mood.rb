
class TeaMoods::Mood

    # A Mood has many teas
    attr_accessor :name, :desc, :teas

    @@all = []

    def initialize(name, desc)
        self.name = name
        self.desc = desc
        self.teas = []

        save
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    # def get_teas
    #     TeaMoods::Scraper.scrape_teas(self) if @teas.empty?
    # end

    # def teas
    #     TeaMoods::Tea.all.select {|tea| tea.mood == self}
    # end
end