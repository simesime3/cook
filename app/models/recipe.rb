class Recipe < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true, uniqueness: true
  validates :image, presence: true

  belongs_to :user

  has_many :recipe_ingredients, foreign_key: :recipe_id, dependent: :destroy
  has_many :ingredients, :through => :recipe_ingredients, :source => :ingredient
  # accepts_nested_attributes_for :ingredients

  has_many :recipe_quantities, foreign_key: :recipe_id, dependent: :destroy
  has_many :quantities, :through => :recipe_quantities, :source => :quantity
  # accepts_nested_attributes_for :quantities

  has_many :recipe_steps, foreign_key: :recipe_id, dependent: :destroy
  has_many :steps, :through => :recipe_steps, :source => :step
  # accepts_nested_attributes_for :steps

  mount_uploader :image, ImageUploader

  def recipe_find(find_id)
    @recipe = Recipe.find(find_id)
    return @recipe
  end

  def recipe_edit_store_true(recipe_edit_params, recipe)
    recipe.update!(title: recipe_edit_params[:recipe][:title], image: recipe_edit_params[:recipe][:image])
  end

  def recipe_edit_store_false(recipe_edit_params, recipe)
    recipe.update!(title: recipe_edit_params[:recipe][:title])
  end
end
