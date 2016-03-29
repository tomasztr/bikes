class ControlPanel::OrdersController < ControlPanel::ControlPanelController

  def index
    @orders = OrderDecorator.decorate_collection(Order.all)
  end

  def create
    orders = OrdersCreator.new(params, current_user)
    if orders.create
      redirect_to control_panel_bikes_path, notice: orders.notice_message
    else
      redirect_to control_panel_bikes_path, alert: orders.alert_message
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.bike.available!
    @order.destroy
    redirect_to control_panel_orders_path, notice: 'Bike was returned!'
  end
end
