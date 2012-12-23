module ApplicationHelper

  def days_left
    Date.today.end_of_month.day - Date.today.day
  end
end
