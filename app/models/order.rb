class Order < ApplicationRecord
  belongs_to :deposit
  belongs_to :user

  has_many :selections
  has_many :products, through: :selections

  validates :deposit, presence: :true
  validates :user, presence: :true

  validates :delivery, presence: :true
  validates :address, presence: :true
  validates :postal_code, presence: :true
  validates :city, presence: :true
  validates :country, presence: :true
  validates :telephone, presence: :true

end
