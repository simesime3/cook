class Quantity < ApplicationRecord
  validates :amount, presence: true

  has_one  :recipe_quantity, foreign_key: :quantity_id, dependent: :destroy
  has_one  :user, through: :recipe_quantity

  def quantity_store(recipe_params, recipe)
    q = 1
    while recipe_params[:"quantities_#{q}"] do
      @quantity = recipe.quantities.new(amount: recipe_params[:"quantities_#{q}"])
      @quantity.save!
      q +=1
    end
  end

  def quantity_edit_store(recipe_edit_params)
    recipe_edit_params[:recipe][:quantities][:quantity_params].each do |quantity|
      @quantity = Quantity.find_by(id: quantity[:id])
      @quantity.update!(amount: quantity[:amount])
    end
  end



  private
  def recipe_params
    quantities = []
    (1..20).each do |i|
      quantities << "quantities_#{i}"
    end
    params.require(:quantity).permit(quantities)
  end
end
