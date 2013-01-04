class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :id
      t.string :name
      t.integer :user_id
      t.decimal :amount
      t.date :date_due

      t.timestamps
    end
  end
end
