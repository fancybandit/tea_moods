
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

        # MAKE SURE NAME IS DOWNCASED, HYPHENATED, & W/O ' or + or & etc.
        doc = Nokogiri::HTML(open("https://www.traditionalmedicinals.com/collection/benefit-#{mood.name.downcase}/"))

        teas = doc.css("div.tm-collection-benefit-section.tm-collection-benefit-section--detox > div a")
        teas.each do |tea|
            link = tea.attr("href")
            name = tea.css("p").text
            TeaMoods::Tea.new(name, link, mood)
        end
        binding.pry
    end

    def self.scrape_tea_desc(tea)
        # IN PROGRESS
    end
end

