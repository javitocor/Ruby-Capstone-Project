require 'rubocop'

require_relative '../lib/bot.rb'

class Start
  def initialize
    banner
  end

  def search
    input
    @searching = Bot.new(@keywords)
    p 'Search in progess...'
    sleep 1
    show_results
    exportation
    research
  end

  private

  def input
    puts 'Search in Disney.com'
    puts 'Please enter the keywords for your search'
    puts 'You can write different keywords, separated by one space, for any single search'
    input = gets.chomp
    while input.empty?
      puts 'Please enter a keyword'
      input = gets.chomp
    end
    p 'Thank you!'
    @keywords = input.split(' ')
  end

  def banner
    puts 'Welcome to'
    puts File.read('./assets/banner.txt')
    puts 'This website helps you to find everything you want in Disney online shop.'
    puts 'Type your keywords separated by one space and press enter to find out everything related to Disney.'
  end

  def show_results
    puts '***********'
    @searching.print_results
    puts '***********'
  end

  def exportation
    sleep 1.5
    @searching.export_csv
    puts '...exporting data...'
    puts 'You can find a file with the results in your current folder'
    puts '**********'
    sleep 1.7
  end

  def research
    print 'Do you need to search anything else? (y/n) '
    research = gets.chomp
    restart(research)
  end

  def restart(research)
    research == 'y' ? search : (p 'Thank you for choosing us, goodbye!')
  end
end

new_search = Start.new
new_search.search
