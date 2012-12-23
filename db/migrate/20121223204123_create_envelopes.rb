class CreateEnvelopes < ActiveRecord::Migration
  def change
    create_table :envelopes do |t|
      t.integer :user_id
      t.decimal :balance
      t.decimal :limit
      t.string :name

      t.timestamps
    end
  end
end
