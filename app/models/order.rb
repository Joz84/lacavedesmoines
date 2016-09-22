class Order < ApplicationRecord
  monetize :amount_cents
  belongs_to :deposit
  belongs_to :user

  has_many :selections
  has_many :products, through: :selections

  validates :deposit, presence: :true
  validates :user, presence: :true

  validates :address, presence: :true
  validates :postal_code, presence: :true
  validates :city, presence: :true
  validates :country, presence: :true
  validates :telephone, presence: :true

  def init_amount
    amount = 0
    self.selections.each { |s| amount += s.quantity * s.product.price } if self.selections.count > 0
    amount
  end

end
