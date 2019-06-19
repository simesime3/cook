class Recipe < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true, uniqueness: true

  belongs_to :user, primary_key: :user_id, foreign_key: :id

  has_one    :recipe_picture
  has_one    :picture, through: :recipe_picture
  accepts_nested_attributes_for :picture

  has_many   :recipe_ingredients
  has_many   :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :ingredients

  has_many   :recipe_quantities
  has_many   :quantities, through: :recipe_quantities
  accepts_nested_attributes_for :quantities

  has_many   :recipe_steps
  has_many   :steps, through: :recipe_steps
  accepts_nested_attributes_for :steps

end
