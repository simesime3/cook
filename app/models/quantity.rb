class Quantity < ApplicationRecord
  validates :amount, presence: true

  has_one  :recipe_quantity, primary_key: :id, foreign_key: :quantity_id
  has_one  :user, through: :recipe_quantity
end
