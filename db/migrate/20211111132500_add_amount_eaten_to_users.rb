class AddAmountEatenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :amount_eaten, :integer
  end
end
