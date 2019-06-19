class RecipePicture < ApplicationRecord
  validates :recipe_id, presence: true
  validates :picture_id, presence: true

  belongs_to :recipe, primary_key: :recipe_id, foreign_key: :id
  belongs_to :picture, primary_key: :picture_id, foreign_key: :id
  
end
