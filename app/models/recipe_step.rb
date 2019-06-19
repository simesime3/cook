class RecipeStep < ApplicationRecord
  validates :recipe_id, presence: true
  validates :step_id, presence: true

  belongs_to :recipe, primary_key: :recipe_id, foreign_key: :id
  belongs_to :step, primary_key: :step_id, foreign_key: :id
end
