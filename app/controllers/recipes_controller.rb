class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes.all
  end

  def new
    @recipe = current_user.recipes.new
    @ingredients = @recipe.ingredients.build
    @quantities  = @recipe.quantities.build
    @steps       = @recipe.steps.build
    # binding.pry
  end

  def create
    ActiveRecord::Base.transaction do
      @recipe = current_user.recipes.new(title: recipe_params[:title], image: recipe_params[:image])
      Ingredient.new.ingredient_store(recipe_params, @recipe)
      Quantity.new.quantity_store(recipe_params, @recipe)
      Step.new.step_store(recipe_params, @recipe)
      @recipe.save!
    end
      redirect_to action: 'index', success: '投稿に成功しました'
    rescue => e
      flash.now[:danger] = "投稿に失敗しました"
      puts e.message
      render :new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    # binding.pry
    @ingredients = @recipe.ingredients
    @quantity = @recipe.quantities
    @steps = @recipe.steps
  end

  def update
    a
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
