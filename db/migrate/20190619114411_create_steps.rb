class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :image
      t.string :detail

      t.timestamps
    end
  end
end
