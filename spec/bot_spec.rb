# spec/bot_spec.rb

require './lib/bot.rb'
require './lib/export.rb'
require 'nokogiri'

RSpec.describe Bot do
  let(:bot) { Bot.new(%w[pixar incredibles]) }
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
