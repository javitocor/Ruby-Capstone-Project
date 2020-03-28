class Bot

    attr_accessor :parse_page

    def initialize(keywords)
        @keywords = keywords
        @result_name = []
        @result_price = []
        @total_results = 0
    end

    def keywords_str(keywords)
        @search_keywords = @keywords.join("+")
        return @search_keywords
    end

    def create_link 
        link = 'https://www.amazon.com/s?k=shoes+blue&ref=nb_sb_noss_2'
        link2 = "https://www.amazon.com/s?k=#{keywords_str(@keywords)}&ref=nb_sb_noss_2"
        return link
    end

    def parse(link)
        doc = HTTParty.get(link)
        @parse_page = Nokogiri::HTML(doc)
        return @parse_page
    end

    def get_names
        parse(create_link)
        @parse_page.css('span.a-size-base-plus.a-color-base.a-text-normal').map do |name|
            name_str = name.text
            @result_name.push(name_str)
        end
    end

    def get_prices
        parse(create_link)
        @parse_page.css('span.a-price-whole').map do |price|
            price_str = price.text
            @result_price.push(price_str)
        end
    end
    
    def total
        @total_results = @result_name.length        
    end

    def print_results
        puts "The search has finished"
        total
        puts "We have found #{@total_results} results that match your keywords"
        puts "Here you can find the list: "
        (0...@total_results).each do |index|
        puts "----Index: #{index+1}----"
        puts "Product: #{@result_name[index]} | Price: #{@result_price[index]}"
        end
    end

end