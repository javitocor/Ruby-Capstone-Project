require 'open-uri'
require 'Nokogiri'
require 'HTTParty'
require 'Pry'
require 'JSON'
require 'csv'

require './lib/bot.rb'

class Start

    def initialize

    end

    def input
        puts 'Search in'
        puts 'Please enter the keywords'
        input = gets.chomp
        if input.empty?
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
        searching = Bot.new
        searching.parse
        show_results
    end

    def show_results
        puts "***********"
        puts "The search has finished"
        puts "We have found #{} results that match your keywords"
        puts "Here you can find the list: "
        puts "***********"
        sleep 2
        puts "You can find a file with the results in "
        sleep 1.5
        research
    end

    def research
        print "Do you want to do another search? (y/n)"
        research = gets.chomp
        research == "y" ? search : (p 'Thank you for choosing us, goodbye!')
    end
    
end


new_search = Start.new
new_search.banner
new_search.search
