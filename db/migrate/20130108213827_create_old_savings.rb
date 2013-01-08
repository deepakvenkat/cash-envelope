class CreateOldSavings < ActiveRecord::Migration
  def change
    create_table :old_savings do |t|
      t.integer :user_id
      t.decimal :amount
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end
