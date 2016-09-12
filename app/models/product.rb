class Product < ApplicationRecord
  belongs_to :alcohol
  belongs_to :brewery
  belongs_to :region
  belongs_to :kind
  belongs_to :color
  belongs_to :fermentation
  belongs_to :specificity
  monetize :price_cents

  has_many :selections
  has_many :stocks

  validates :name, presence: true
  validates :capacity, presence: :true
end
