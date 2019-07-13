class RecipeQuantity < ApplicationRecord
  validates :recipe_id, presence: true
  validates :quantity_id, presence: true

  belongs_to :recipe
  belongs_to :quantity
end
