class CreateUnusualExpenses < ActiveRecord::Migration
  def change
    create_table :unusual_expenses do |t|
      t.string :name
      t.decimal :amount
      t.date :date_incurred

      t.timestamps
    end
  end
end
