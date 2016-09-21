class New < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  has_attachments :photos, maximum: 10
end
