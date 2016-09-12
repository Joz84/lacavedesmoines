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
  has_many :orders, through: :selections
  has_many :stocks
  has_many :deposits, through: :stocks

  validates :name, presence: true
  validates :capacity, presence: :true
  validates :sku, presence: :true

  validates :alcohol, presence: :true
  validates :brewery, presence: :true
  validates :kind, presence: :true
  validates :color, presence: :true
  validates :fermentation, presence: :true
  validates :specificity, presence: :true
end
