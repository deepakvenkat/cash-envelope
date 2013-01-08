class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :income

  has_many :envelopes
  has_many :expenses
  has_many :transactions, through: :envelopes
  has_many :old_savings

  def remaining
    envelopes.sum(:limit).to_f - envelopes.sum(:balance).to_f
  end
end
