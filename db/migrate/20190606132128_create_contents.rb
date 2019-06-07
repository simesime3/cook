class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.integer :title
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
