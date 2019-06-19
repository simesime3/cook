class Ingredient < ApplicationRecord
  validates :name, presence: true

  has_one  :recipe_ingredient, primary_key: :id, foreign_key: :ingredient_id
  has_one  :user, through: :recipe_ingredient
end
