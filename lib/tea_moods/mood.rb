
class TeaMoods::Mood

    attr_accessor :name, :teas

    def self.list
        # Scrape benefits page & return moods from that page
        self.scrape_moods
    end

    def self.scrape_moods
        moods = []
        # Go to Traditional Medicinals benefits page
        # Extract the moods
        # Instantiate moods
        moods
    end
end