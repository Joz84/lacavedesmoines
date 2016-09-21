class Brewery < ApplicationRecord
  has_many :products
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :sku, presence: true
  validates :sku, uniqueness: true
  has_attachments :photos, maximum: 10
end
