# spec/bot_spec.rb

require './lib/bot.rb'
require './lib/export.rb'
require 'nokogiri'

RSpec.describe Bot do
  let(:bot) { Bot.new(%w[pixar incredibles]) }
  describe '#num_pages' do
    it 'return an integer with the total number of pages' do
      expect(bot.num_pages).to eql(1)
    end
  end
  describe '#keywords_str' do
    let(:keywords) { %w[pixar incredibles] }
    it 'returns an string with the keywords separated by +' do
      expect(bot.keywords_str(keywords)).to eql('pixar+incredibles')
    end
  end
  describe '#create_link' do
    it 'returns an string with the url and the keywords' do
      expect(bot.create_link.class).to eql(String)
    end
  end
  describe '#parse' do
    let(:link) { 'https://www.shopdisney.co.uk/search?q=pixar+incredibles' }
    it 'returns an object with the HTML information' do
      expect(bot.parse(link).class).to eql(Nokogiri::HTML::Document)
    end
  end
  describe '#get_names' do
    it 'returns an array with the products of the search' do
      expect(bot.get_names.class).to eql(Array)
    end
  end
  describe '#get_prices' do
    it 'returns an array with the prices of the products' do
      expect(bot.get_names.class).to eql(Array)
    end
  end
  describe '#print_results' do
    it 'returns a list with products and its prices' do
      expect(bot.print_results).to eql('The prices are shown in UK Pounds')
    end
  end
  describe '#export_csv' do
    it 'returns file with the information scraped' do
      expect(File.exist?('search_disney.csv')).to eql(true)
    end
  end
end
