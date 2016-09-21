class Deposit < ApplicationRecord
  has_many :stocks
  has_many :orders
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :capacity, presence: true
  validates :capacity, numericality: { only_integer: true }
  has_attachments :photos, maximum: 10
end
