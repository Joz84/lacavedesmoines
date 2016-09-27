class Product < ApplicationRecord
  belongs_to :alcohol
  belongs_to :brewery
  belongs_to :region
  belongs_to :kind
  belongs_to :color
  belongs_to :fermentation
  belongs_to :specificity
  monetize :price_cents
  has_attachments :photos, maximum: 10

  has_many :selections
  has_many :orders, through: :selections
  has_many :stocks
  has_many :deposits, through: :stocks

  validates :name, presence: true
  validates :capacity, presence: :true
  validates :capacity, numericality: true
  validates :sku, presence: :true
  validates :sku, uniqueness: true

  validates :alcohol, presence: :true
  validates :brewery, presence: :true
  validates :kind, presence: :true
  validates :color, presence: :true
  validates :fermentation, presence: :true
  #validates :specificity, presence: :true

  include PgSearch
  pg_search_scope :pgsearch,
    against: [:name, :description, :country],
    associated_against: {
      alcohol: :name,
      brewery: :name,
      region: :name,
      kind: :name,
      color: :name,
      fermentation: :name,
      specificity: :name
    }

  def matching(nbr)
    m = {}
    Product.all.each { |p| m[p.sku.to_sym] = (self.weighted_attributes & p.weighted_attributes).count if p != self }
    m = (m.sort_by { |sku, score| score }).reverse[0...nbr].to_h
    m.map { |sku, score| Product.find_by(sku: sku.to_sym) }
  end

  def weighted_attributes
    select_attr = { name: 5,
                    alcohol_id: 10,
                    brewery_id: 8,
                    region_id: 3,
                    country: 3,
                    capacity: 1,
                    kind_id: 7,
                    color_id: 6,
                    fermentation_id: 6,
                    degree: 5,
                    specificity: 8
                    }

    weighted_attr = []
    select_attr.each do |k, v|
      if self.attributes[k.to_s]
        (0..v).each_with_index { |a, i| weighted_attr << "#{i}-#{k.to_s}: #{self.attributes[k.to_s]}" }
      end
    end
    weighted_attr
  end

end
