class MyImage < ApplicationRecord
  validates :user_id, presence: true, uniqueness: true
  validates :image, presence: true

  belongs_to  :user, optional: true, primary_key: :user_id, foreign_key: :id

  mount_uploader :image, ImageUploader

end
