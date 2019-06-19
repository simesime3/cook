class CreateRecipePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_pictures do |t|
      t.references :recipe, foreign_key: true
      t.references :picture, foreign_key: true

      t.timestamps
    end
  end
end
