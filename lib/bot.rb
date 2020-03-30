require 'Nokogiri'
require 'HTTParty'
require 'csv'

require_relative '../lib/export.rb'

class Bot
  attr_accessor :parse_page, :result_name, :result_price

  def initialize(keywords)
    @keywords = keywords
    @result_name = []
    @result_price = []
    parse(create_link)
    num_pages
    parse_results
  end

  def num_pages
    @items = @parse_page.css('h6#total-items span').text.to_f
    @items_per_page = 96
    @pages = (@items / @items_per_page).ceil
    @pages
  end

  def keywords_str(_keywords)
    @search_keywords = @keywords.join('+')
    @search_keywords
  end

  def create_link
    link = "https://www.shopdisney.co.uk/search?q=#{keywords_str(@keywords)}"
    link
  end

  def parse(link)
    doc = HTTParty.get(link)
    @parse_page = Nokogiri::HTML(doc)
    @parse_page
  end

  # rubocop: disable Style/NumericPredicate
  def parse_results
    if @items < @items_per_page
      products
      prices
    else
      @number = 0
      while @pages > 0
        link2 = "https://www.shopdisney.co.uk/search?q=disney&sz=96&start=#{@number}"
        parse(link2)
        products
        prices
        @pages -= 1
        @number += 96
      end
    end
  end

  # rubocop: enable Style/NumericPredicate
  def products
    parse_page.css('h4.product__tilename').map do |name|
      name_str = name.text
      @result_name.push(name_str)
    end
  end

  def prices
    parse_page.css('span.price__current').map do |price|
      price_str = price.text
      price_str = price_str.strip
      @result_price.push(price_str)
    end
  end

  def print_results
    puts 'The search has finished'
    puts "We have found #{@items.to_i} results that match your keywords"
    puts 'Here you can find the list: '
    (0...@items).each do |index|
      puts "---- Index: #{index + 1} ----"
      puts "Product: #{@result_name[index]} | Price: #{@result_price[index]}"
    end
    p 'The prices are shown in UK Pounds'
  end

  def export_csv
    @data = Export.new(@result_name, @result_price)
  end
end
