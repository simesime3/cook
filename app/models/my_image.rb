class MyImage < ApplicationRecord
  validates :user_id, presence: true, uniqueness: true
  validates :image, presence: true

  belongs_to  :user

  mount_uploader :image, ImageUploader
end
