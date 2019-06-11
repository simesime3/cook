class CreateMyImages < ActiveRecord::Migration[5.2]
  def change
    create_table :my_images do |t|
      t.references :user, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
