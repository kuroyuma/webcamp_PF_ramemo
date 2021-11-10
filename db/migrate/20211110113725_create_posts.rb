class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image_id
      t.string :shop_name
      t.string :food_name
      t.integer :genre
      t.integer :price
      t.string :introduction
      t.integer :prefecture
      t.integer :user_id

      t.timestamps
    end
  end
end
