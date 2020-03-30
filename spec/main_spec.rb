# spec/main.rb

require './bin/main.rb'

RSpec.describe Start do
  let(:start_class) { Start.new }
  describe '#input' do
    it 'returns an array with the keywords' do
      expect(start_class.input.class).to eql(Array)
    end
  end
  describe '#banner' do
    it 'Returns the banner' do
      expect(File.exist?('./assets/banner.txt')).to eql(true)
    end
  end
  describe '#restart' do
    it 'return a farewell message when user exits program' do
      expect(start_class.restart('n')).to eql('Thank you for choosing us, goodbye!')
    end
  end
end
