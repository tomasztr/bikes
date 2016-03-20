class OrdersCreator

  ERRORS = {
    'ActiveRecord::RecordNotFound' => 'Bike not found!',
    'ActiveRecord::RecordInvalid' => 'Something went wrong!',
    'RuntimeError' => 'One or more of bikes are not available!',
  }

  attr_reader :params, :current_user

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def create
    begin
      bikes = Bike.find(params[:bike_ids])
      ActiveRecord::Base.transaction do
        bikes.each do |bike|
          fail unless bike.available?
          current_user.orders.create!(bike: bike, time: params[:time])
          bike.unavailable!
        end
      end
      true
    rescue => error
      @alert_message = ERRORS[error.class.to_s] and return false
    end
  end

  def notice_message
    'Ordered!'
  end

  def alert_message
    @alert_message
  end
end
