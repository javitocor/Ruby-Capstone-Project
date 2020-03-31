require 'csv'
require 'rubocop'

class Export
  def initialize(products, prices, access)
    @products = products
    @prices = prices
    @access = access
    export_data
  end

  def export_data
    CSV.open('search_disney.csv', 'w') do |csv|
      @products.zip(@prices, @access) { |x| csv << x }
    end
  end
end
