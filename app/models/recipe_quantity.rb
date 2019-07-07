class RecipeQuantity < ApplicationRecord
  validates :recipe_id, presence: true
  validates :quantity_id, presence: true

  belongs_to :recipe, primary_key: :recipe_id
  belongs_to :quantity, primary_key: :quantity_id
end
