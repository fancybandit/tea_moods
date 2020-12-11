
class TeaMoods::Scraper

    def self.scrape_moods
        moods = []

        doc = Nokogiri::HTML(open("https://www.traditionalmedicinals.com/collection/benefit-all/"))
        mood = doc.css("div.tm-collection-benefit-section div.tm-collection-product.tm-collection-product--intro h2 span")
        binding.pry
        # Go to Traditional Medicinals benefits page
        # Extract the moods
        # Instantiate moods
        moods
    end
end