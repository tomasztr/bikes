class OrderDecorator < Draper::Decorator
  include Times
  delegate_all
  
  def formatted_time
    AVAILABLE_TIMES.each { |el| return el[:key] if el[:value] == time }
  end

  def formatted_created_at
    created_at.strftime("%m/%d/%Y on %I:%M%p")
  end
end
