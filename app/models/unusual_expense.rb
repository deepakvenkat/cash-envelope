class UnusualExpense < ActiveRecord::Base
  attr_accessible :amount, :date_incurred, :name
  belongs_to :user
end
