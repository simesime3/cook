class CreateMyPages < ActiveRecord::Migration[5.2]
  def change
    create_table :my_pages do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :material, foreign_key: true

      t.timestamps
    end
  end
end
