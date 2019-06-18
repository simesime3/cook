class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes.all
  end

  def new
    @recipe = current_user.recipes.new
    # @foods = @recipe.foods.new(recipe_id: @recipe.id)
  end

  def create
    # binding.pry
    @recipe = current_user.recipes.new(recipe_params)
    # logger = Rails.logger
    # logger.debug current_user.id
    if @recipe.save
      redirect_to '/recipes', success: '投稿に成功しました'
    else

      flash.now[:danger] = "投稿に失敗しました"
      render :action => "new"
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title)
  end
end
