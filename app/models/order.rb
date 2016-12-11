class Order < ApplicationRecord
  monetize :amount_cents
  belongs_to :deposit
  belongs_to :user

  has_many :selections, dependent: :destroy
  has_many :products, through: :selections

  validates :deposit, presence: :true
  validates :user, presence: :true

  validates :address, presence: :true
  validates :postal_code, presence: :true
  validates :city, presence: :true
  validates :country, presence: :true
  validates :telephone, presence: :true

  geocoded_by :order_address
  after_validation :geocode, if: :order_address_changed?

  def postal_costs
    amount = self.init_amount
    localisation =  Order.where(id: self.id).near('Bordeaux', 50) +
                    Order.where(id: self.id).near('Portets', 50) +
                    Order.where(id: self.id).near('Montmarsan', 50)
    costs = !localisation.empty? && amount.to_f >= 20 ? 0 : Money.new(10 * 100)
  end

  def init_amount
    amount = 0
    self.selections.each { |s| amount += s.quantity * s.product.price } if self.selections
    amount
  end

  def order_address
    "#{address} #{complement}, #{postal_code} #{city}, #{country}"
  end

  def order_address_changed?
    city_changed? || postal_code_changed? || address_changed? || country_changed?
  end

end
