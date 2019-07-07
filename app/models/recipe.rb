class Recipe < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true, uniqueness: true
  validates :image, presence: true

  belongs_to :user

  has_many   :recipe_ingredients, foreign_key: :recipe_id, dependent: :destroy
  has_many   :ingredients, through: :recipe_ingredients
  # accepts_nested_attributes_for :ingredients

  has_many   :recipe_quantities, foreign_key: :recipe_id, dependent: :destroy
  has_many   :quantities, through: :recipe_quantities
  # accepts_nested_attributes_for :quantities

  has_many   :recipe_steps, foreign_key: :recipe_id, dependent: :destroy
  has_many   :steps, through: :recipe_steps
  # accepts_nested_attributes_for :steps

  mount_uploader :image, ImageUploader

end
