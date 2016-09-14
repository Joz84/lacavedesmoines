class Selection < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :product, presence: :true
  validates :order, presence: :true
end
