class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.date :date_spent
      t.string :name
      t.integer :envelope_id

      t.timestamps
    end
  end
end
