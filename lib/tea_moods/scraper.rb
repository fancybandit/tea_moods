
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

    def self.scrape_teas(mood)
        prep_name = mood.name.gsub(/[^0-9A-Za-z" "]/, '').downcase
        mood_url_name = prep_name.split(" ").join("-")

        doc = Nokogiri::HTML(open("https://www.traditionalmedicinals.com/collection/benefit-#{mood_url_name}/"))

        teas = doc.css("div.tm-collection-benefit-section.tm-collection-benefit-section--#{mood_url_name} > div a")

        teas.each do |tea|
            name = tea.css("p").text
            url = tea.attr("href")
            TeaMoods::Tea.new(name, url, mood)
        end
    end

    def self.scrape_tea_desc(tea)
        link = tea.url

        doc = Nokogiri::HTML(open(link))

        tea_info = doc.css("div.trm-product-details > p:nth-child(3)").text.split("\n")
        description = tea_info[1]

        tea.desc = description
    end
end

