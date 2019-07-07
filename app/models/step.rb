class Step < ApplicationRecord
  validates :image, presence: true
  validates :detail, presence: true

  has_one  :recipe_step, foreign_key: :step_id, dependent: :destroy
  has_one  :user, through: :recipe_step, dependent: :destroy
end
