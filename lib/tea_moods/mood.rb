
class TeaMoods::Mood

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
end