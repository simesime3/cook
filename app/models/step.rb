class Step < ApplicationRecord
  validates :step, presence: true

  has_one  :recipe_step, primary_key: :recipe_id, foreign_key: :step_id
  has_one  :user, through: :recipe_step
end
