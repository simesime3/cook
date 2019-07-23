class Step < ApplicationRecord
  validates :image, presence: true
  validates :detail, presence: true

  has_one  :recipe_step, foreign_key: :step_id, dependent: :destroy
  has_one  :user, through: :recipe_step, dependent: :destroy

  mount_uploader :image, ImageUploader

  def step_store(recipe_params, recipe)
    @steps = recipe.steps.new(image: recipe_params[:steps][:image], detail: recipe_params[:steps][:detail])
    @steps.save!
  end

  def step_edit_store(recipe_edit_params)
    recipe_edit_params[:step][:step_params].each do |step|
      @step = Ingredient.find_by(id: step.id)
      @step.update!(image: step.image, detail: step.detail)
    end
  end

  private
  def recipe_params
    params.require(:step).permit(steps: [:image, :detail])
  end

end
