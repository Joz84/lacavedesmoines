class Selection < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true
  validates :product, presence: :true
  validates :order, presence: :true
end
