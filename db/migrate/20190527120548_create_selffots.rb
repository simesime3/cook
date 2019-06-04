class CreateSelffots < ActiveRecord::Migration[5.2]
  def change
    create_table :selffots do |t|
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
