class Stock < ApplicationRecord
  belongs_to :deposit
  belongs_to :product
  monetize :buying_price_cents

  validates :deposit, uniqueness: { scope: :product }
  validates :quantity, presence: true
  validates :received_at, presence: true
end
