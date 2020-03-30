require 'csv'

class Export
  def initialize(products, prices, access)
    @products = products
    @prices = prices
    @access = access
    export_data
  end

  def export_data
    CSV.open('search_disney.csv', 'w') do |csv|
      csv << @products
      csv << @prices
      csv << @access
    end
  end
end
