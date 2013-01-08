class OldSaving < ActiveRecord::Base
  attr_accessible :amount, :month, :user_id, :year
  belongs_to :user
end
