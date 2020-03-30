require 'Nokogiri'
require 'HTTParty'
require 'csv'

require_relative '../lib/bot.rb'
require_relative '../lib/export.rb'

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
        p "Thank you!"
    end

    def banner
        p File.read('./assets/banner.txt')
    end

    def search
        input
        @searching = Bot.new(@keywords)
        p "Search in progess..."
        sleep 1
        show_results
        exportation                
        research
    end

    def show_results
        p "***********"
        @searching.print_results
        p "***********"
    end

    def exportation        
        sleep 1.5
        @searching.export_csv
        puts "...exporting data..."
        puts "You can find a file with the results in your current folder"
        puts "-----------"
        sleep 1.7
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
