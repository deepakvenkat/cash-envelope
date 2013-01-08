class Envelope < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  attr_accessible :balance, :limit, :name, :user_id
  validates :limit, :name, presence: true
  after_create :set_balance

  def set_balance
    self.balance = self.limit
    self.save!
  end

  def self.refresh_balance
  	self.balance = self.limit
  	self.save!
  end
end
