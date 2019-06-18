class RecipeImage < ApplicationRecord
  validates :recipe_id, presence: true, uniqueness: true
  validates :image, presence: true

  belongs_to  :recipe, primary_key: :recipe_id, foreign_key: :id

  mount_uploader :image, ImageUploader
end
