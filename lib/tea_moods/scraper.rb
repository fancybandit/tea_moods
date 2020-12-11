
class TeaMoods::Scraper

    def self.scrape_moods
        doc = Nokogiri::HTML(open("https://www.traditionalmedicinals.com/collection/benefit-all/"))

        moods = doc.css("div.tm-collection-benefit-section div.tm-collection-product.tm-collection-product--intro")

        moods.each do |mood|
            name = mood.css("h2:first-of-type span").text
            desc = mood.css("p").text
            TeaMoods::Mood.new(name, desc)
        end
    end

    def self.scrape_mood_desc(mood)
        # IN PROGRESS
    end

    def self.scrape_teas(mood)
        doc = Nokogiri::HTML(open("https://www.traditionalmedicinals.com/collection/benefit-all/"))

        teas = doc.css()
    end

    def self.scrape_tea_desc(tea)
        # IN PROGRESS
    end
end

