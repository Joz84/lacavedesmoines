class Stock < ApplicationRecord
  belongs_to :deposit
  belongs_to :product
  monetize :buying_price_cents
end
