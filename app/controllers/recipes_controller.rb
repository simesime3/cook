class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes.all
  end

  def new
    @recipe = current_user.recipes.new
    @ingredients = @recipe.ingredients.build
    @quantities  = @recipe.quantities.build
    @steps       = @recipe.steps.build
  end

  def create
    ActiveRecord::Base.transaction do
      @recipe = current_user.recipes.new(title: recipe_params[:title], image: recipe_params[:image])
      # binding.pry
      i = 1
      while recipe_params[:"ingredients_#{i}"] do
        @ingredient = @recipe.ingredients.new(name: recipe_params[:"ingredients_#{i}"])
        @ingredient.save!
        i +=1
      end
      q = 1
      while recipe_params[:"quantities_#{q}"] do
        @quantity = @recipe.quantities.new(amount: recipe_params[:"quantities_#{q}"])
        @quantity.save!
        q +=1
      end
      @steps = @recipe.steps.new(image: recipe_params[:steps][:image], detail: recipe_params[:steps][:detail])
      @recipe.save! && @steps.save!
    end
      redirect_to action: 'index', success: '投稿に成功しました'
    rescue => e
      flash.now[:danger] = "投稿に失敗しました"
      puts e.message
      render :new
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
    # binding.pry
    @ingredients = @recipe.recipe_ingredients.where(recipe_id :id).where(customer: { id: 1 })
  end

  private
  def recipe_params
    ingredients = []
    quantities = []
    (1..20).each do |i|
      ingredients << "ingredients_#{i}"
      quantities << "quantities_#{i}"
    end
    params.require(:recipe).permit(:title, :image, ingredients, quantities,
      steps: [:image, :detail]
    )
  end
end
