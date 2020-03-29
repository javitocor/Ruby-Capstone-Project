require 'Nokogiri'
require 'HTTParty'
require 'csv'

require_relative '../lib/bot.rb'

class Start

    def initialize
     @keywords = []
    end

    def input
        puts 'Search in Disney.com'
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
        puts File.read('./assets/banner.txt')
    end

    def search
        input
        @searching = Bot.new(@keywords)
        show_results
    end

    def show_results
        puts "***********"
        @searching.print_results
        puts "***********"
        sleep 1.5
        puts "You can find a file with the results in "
        sleep 1.7
        research
    end

    def research
        print "Do you need to search anything else? (y/n) "
        research = gets.chomp
        research == "y" ? search : (p 'Thank you for choosing us, goodbye!')
    end
    
end


new_search = Start.new
new_search.banner
new_search.search
