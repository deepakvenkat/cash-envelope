class Transaction < ActiveRecord::Base
  attr_accessible :amount, :date_spent, :envelope_id, :name
  belongs_to :envelope
  belongs_to :user
  validates :amount, presence: true
  after_create :check_date
  after_create :update_envelope

  def check_date
    if self.date_spent.blank?
      self.date_spent = Date.today
      self.save!
    end
  end

  def update_envelope
    envelope = Envelope.find(self.envelope_id)
    previous_balance = envelope.balance
    new_balance = previous_balance - amount
    envelope.update_attribute(:balance, new_balance)
  end

  def this_month
    where('date_spent between ? and ?', Date.today.beginning_of_month, Date.today)
  end
end
