class Transaction < ActiveRecord::Base
  attr_accessible :amount, :date_spent, :envelope_id, :name
  belongs_to: envelope
end
