class Picture < ApplicationRecord
  validates :image, presence: true

  has_one  :recipe_picture, primary_key: :id, foreign_key: :picture_id
  has_one  :user, through: :recipe_picture

  mount_uploader :image, ImageUploader

end
