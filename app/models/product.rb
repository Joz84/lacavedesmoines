class Product < ApplicationRecord
  belongs_to :alcohol
  belongs_to :brewery
  belongs_to :region
  belongs_to :kind
  belongs_to :color
  belongs_to :fermentation
end
