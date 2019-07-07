class Quantity < ApplicationRecord
  validates :amount, presence: true

  has_one  :recipe_quantity, foreign_key: :quantity_id, dependent: :destroy
  has_one  :user, through: :recipe_quantity
end
