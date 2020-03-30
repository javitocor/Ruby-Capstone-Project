require 'csv'

class Export
  def initialize(products, prices)
    @products = products
    @prices = prices
    export_data
  end

  def export_data
    CSV.open('search_disney.csv', 'w') do |csv|
      csv << @products
      csv << @prices
    end
  end
end
