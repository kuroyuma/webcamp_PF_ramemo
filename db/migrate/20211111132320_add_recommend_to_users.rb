class AddRecommendToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :recommend, :string
  end
end
