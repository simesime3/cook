class CreateRecipeQuantities < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_quantities do |t|
      t.references :recipe, foreign_key: true
      t.references :quantity, foreign_key: true

      t.timestamps
    end
  end
end
