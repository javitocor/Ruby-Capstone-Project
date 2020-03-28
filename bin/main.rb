require 'open-uri'
require 'Nokogiri'
require 'HTTParty'
require 'Pry'
require 'JSON'
require 'csv'

require_relative '../lib/bot.rb'

class Start

    def initialize
     @keywords = []
    end

    def input
        puts 'Search in amazon.com'
        puts 'Please enter the keywords for your search'
        puts 'You can write different keywords separated by one space'
        input = gets.chomp
        while input.empty?
            puts "Please enter a keyword"
            input = gets.chomp
        end
        @keywords = input.split(" ")
    end

    def banner
        puts File.read('./banner.txt')
    end

    def search
        input
        @searching = Bot.new(@keywords)
        @searching.get_names
        @searching.get_prices
        show_results
    end

    def show_results
        puts "***********"
        @searching.print_results
        puts "***********"
        sleep 2
        puts "You can find a file with the results in "
        sleep 1.5
        research
    end

    def research
        print "Do you want to do another search? (y/n) "
        research = gets.chomp
        research == "y" ? search : (p 'Thank you for choosing us, goodbye!')
    end
    
end


new_search = Start.new
new_search.banner
new_search.search
