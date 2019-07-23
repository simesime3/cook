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
    @ingredients = @recipe.ingredients
    @quantities = @recipe.quantities
    @steps = @recipe.steps
  end

  def update
    ActiveRecord::Base.transaction do
      @recipe = Recipe.find(params[:id])
      Ingredient.new.ingredient_edit_store(recipe_edit_params)
      Quantity.new.quantity_edit_store(recipe_edit_params)
      Step.new.step_edit_store(recipe_edit_params)
      @recipe.update!.(title: recipe_edit_params[:title], image: recipe_params_edit[:image])
    end
      redirect_to action: 'index', success: '編集に成功しました'
    # rescue => e
      flash.now[:danger] = "編集に失敗しました"
      puts e.message
      @recipe = Recipe.find(params[:id])
      @ingredients = @recipe.ingredients
      @quantities = @recipe.quantities
      @steps = @recipe.steps
      render :edit
    end
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
  def recipe_edit_params
    params.permit(:title, :image, recipe: [
      ingredients: [ingredient_params: [:id, :name]], quantities: [quantitie_params: [:id, :amount]], steps: [step_params: [:id, :image, :detail]]
    ])
  end
