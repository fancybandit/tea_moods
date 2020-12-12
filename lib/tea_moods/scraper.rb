
class TeaMoods::Scraper

    def self.scrape_moods
        doc = Nokogiri::HTML(open("https://www.traditionalmedicinals.com/collection/benefit-all/"))

        moods = doc.css("div.tm-collection-benefit-section div.tm-collection-product.tm-collection-product--intro")

        functional_moods = moods.reject do |mood|
            name = mood.css("h2:first-of-type span").text
            name == "H+H Tea" || name == "Accessories"
        end

        functional_moods.each do |mood|
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
        prep_name = mood.name.gsub(/[^0-9A-Za-z" "]/, '').downcase
        prep_name = prep_name.split(" ").join("-")
        doc = Nokogiri::HTML(open("https://www.traditionalmedicinals.com/collection/benefit-#{prep_name}/"))

        teas = doc.css("div.tm-collection-benefit-section.tm-collection-benefit-section--#{prep_name} > div a")
        teas.each do |tea|
            link = tea.attr("href")
            name = tea.css("p").text
            TeaMoods::Tea.new(name, link, mood)
        end
    end

    def self.scrape_tea_desc(tea)
        # IN PROGRESS
    end
end

