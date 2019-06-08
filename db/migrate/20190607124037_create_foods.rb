class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer :content_id
      t.string :ingredient
      t.string :quantity

      t.timestamps
    end
  end
end
