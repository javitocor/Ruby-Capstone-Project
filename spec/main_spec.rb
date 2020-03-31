# spec/main.rb

require './bin/main.rb'

RSpec.describe Start do
  let(:start_class) { Start.new }
  describe '#banner' do
    it 'Returns the banner' do
      expect(File.exist?('./assets/banner.txt')).to eql(true)
    end
  end
end
