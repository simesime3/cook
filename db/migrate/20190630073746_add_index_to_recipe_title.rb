class AddIndexToRecipeTitle < ActiveRecord::Migration[5.2]
  def change
    add_index :recipes, :title
  end
end
