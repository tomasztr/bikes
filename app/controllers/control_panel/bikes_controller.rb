class ControlPanel::BikesController < ControlPanel::ControlPanelController
  before_action :find_bike, only: [:edit, :update, :destroy]
  
  def index
    @bikes = Bike.all
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to control_panel_bikes_path, notice: 'Bike was successfuly created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bike.update(bike_params)
      redirect_to control_panel_bikes_path, notice: 'Bike was succssfuly updated'
    else
      render :edit
    end
  end

  def destroy
    @bike.destroy
    redirect_to control_panel_bikes_path, notice: "Bike with number: #{@bike.id} was successfuly destroyed"
  end

  private

  def find_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:brand, :status, :size)
  end
end
