class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes.all
  end

  def new
    @recipe = current_user.recipes.new
    @picture = @recipe.build_picture
    @ingredients = @recipe.ingredients.build
    @quantities  = @recipe.quantities.build
    @steps       = @recipe.steps.build
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    @picture = @recipe.build_picture(image: recipe_params[picture_attribute: [:image]])
    @ingredients = @recipe.ingredients.build(name: recipe_params[ingredients_attributes: [:name]])
    @quantities = @recipe.quantities.build(amount: recipe_params[quantities_attributes: [:amount]])
    @steps = @recipe.steps.build(image: recipe_params[steps_attributes: [:image]], detail: recipe_params[steps_attributes: [:detail]])
    if @recipe.save && @ingredients.save && @picture.save && @quantities.save && @steps.save
      redirect_to '/recipes', success: '投稿に成功しました'
    else
      # @recipe = current_user.recipes.new(recipe_params)
      flash.now[:danger] = "投稿に失敗しました"
      render "new"
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(
      :title,
      racipe_picture_attributes: [:image],
      racipe_ingredients_attributes: [:name],
      racipe_quantities_attributes: [:amount],
      racipe_steps_attributes: [:image, :detail]
    )
  end
end
