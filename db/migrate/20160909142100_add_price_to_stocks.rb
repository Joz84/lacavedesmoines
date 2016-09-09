class AddPriceToStocks < ActiveRecord::Migration[5.0]
  def change
    add_monetize :stocks, :buying_price, currency: { present: false }
  end
end
