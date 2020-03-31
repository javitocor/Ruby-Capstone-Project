require 'csv'
require 'rubocop'

class Export
  def initialize(products, prices, access, searches)
    @products = products
    @prices = prices
    @access = access
    @searches = searches
    export_data
  end
  private
  def export_data
    CSV.open("search_disney(#{@searches}).csv", "w") do |csv|
      @products.zip(@prices, @access) { |x| csv << x }
    end
  end
end