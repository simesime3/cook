class RecipeStep < ApplicationRecord
  validates :recipe_id, presence: true
  validates :step_id, presence: true

  belongs_to :recipe
  belongs_to :step
end
