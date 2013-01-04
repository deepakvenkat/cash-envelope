class Expense < ActiveRecord::Base
  attr_accessible :amount, :date_due, :id, :name, :user_id
  belongs_to :user
end
