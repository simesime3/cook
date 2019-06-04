class Storage < ApplicationRecord
  validates :user_id, presence: true
  validates :category, presence: true
  validates :material, presence: true

  belongs_to :user
end
