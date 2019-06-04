class CreateStorages < ActiveRecord::Migration[5.2]
  def change
    create_table :storages do |t|
      t.integer :user_id
      t.string :category
      t.string :material

      t.timestamps
    end
  end
end
