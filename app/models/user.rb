class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :income

  has_many :envelopes
  has_many :expenses
  has_many :transactions, through: :envelopes
  has_many :old_savings
  has_many :unusual_expenses

  def remaining
    envelopes.sum(:balance).to_f
  end

  def savings
  	envelopes_sum = envelopes.collect {|e| e.balance.abs}.sum.to_f
  	expenses_sum = expenses.sum(:amount).to_f
  	income - (envelopes_sum + expenses_sum)
  end
end
