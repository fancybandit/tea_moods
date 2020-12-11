
class TeaMoods::Scraper

    def self.scrape_moods
        doc = Nokogiri::HTML(open("https://www.traditionalmedicinals.com/collection/benefit-all/"))

        moods = doc.css("div.tm-collection-benefit-section div.tm-collection-product.tm-collection-product--intro h2:first-of-type span")

        moods.each do |mood|
            name = mood.text
            TeaMoods::Mood.new(name)
        end
    end
end