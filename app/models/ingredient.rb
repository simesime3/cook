class Ingredient < ApplicationRecord
  validates :name, presence: true

  has_one  :recipe_ingredient, foreign_key: :ingredient_id, dependent: :destroy
  has_one  :user, through: :recipe_ingredient
  has_one  :recipe, through: :recipe_ingredient

  def ingredient_store(recipe_params, recipe)
    i = 1
    while recipe_params[:"ingredients_#{i}"] do
      @ingredient = recipe.ingredients.new(name: recipe_params[:"ingredients_#{i}"])
      @ingredient.save!
      i +=1
    end
  end

  private
  def recipe_params
    ingredients = []
    (1..20).each do |i|
      ingredients << "ingredients_#{i}"
    end
    params.require(:ingredient).permit(ingredients)
  end

end
