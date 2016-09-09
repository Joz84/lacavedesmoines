class Order < ApplicationRecord
  belongs_to :deposit
  belongs_to :user
end
