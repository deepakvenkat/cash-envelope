class AddIncomeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :income, :decimal
  end
end
