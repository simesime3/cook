class Content < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :image, presence: true

  has_many  :foods
  has_one   :user

  mount_uploader :image, ImageUploader
end
