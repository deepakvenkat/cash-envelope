class ChangeDatatypeOfDueDate < ActiveRecord::Migration
  def up
  	remove_column :expenses, :date_due
  	add_column :expenses, :date_due, :integer
  end

  def down
  end
end
