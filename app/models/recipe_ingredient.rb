class RecipeIngredient < ApplicationRecord
  validates :recipe_id, presence: true
  validates :ingredient_id, presence: true

  belongs_to :recipe, primary_key: :recipe_id
  belongs_to :ingredient, primary_key: :ingredient_id
end
