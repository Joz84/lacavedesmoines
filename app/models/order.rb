class Order < ApplicationRecord
  belongs_to :deposit
  belongs_to :user

  has_many :selections
  has_many :products, through: :selections
end
