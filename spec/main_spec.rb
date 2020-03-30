# spec/main.rb

require './bin/main.rb'

RSpec.describe Start do
    let(:start_class) {Start.new}
    describe '#input' do
        it 'returns array with keywords and a thank you message' do
            expect(start_class.input).to eql("Thank you!")
        end
    end
    describe '#research' do
        it 'return a farewell message when user exits program' do
            expect(start_class.research).to eql('Thank you for choosing us, goodbye!')
        end
    end    
end