class Ingredient < ApplicationRecord
  validates :name, presence: true

  has_one  :recipe_ingredient, foreign_key: :ingredient_id, dependent: :destroy
  has_one  :user, through: :recipe_ingredient
  has_one  :recipe, through: :recipe_ingredient
end
