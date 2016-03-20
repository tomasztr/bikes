class ControlPanel::ControlPanelController < ApplicationController
  # Ten kontroler jest do innego layoutu rozbilem layouty na dwa bo w jedynm
  # bedzie podpiety bootstrap wiec lepiej zeby go nie miec na glownej stronie
  # on narzuca sporo dziwnych rzeczy jak sie nie uzywa go to przeszkadza :)
  # to taka dobra praktyka

  before_action :authorize_user
  layout 'control_panel'

  private

  def authorize_user
    return if current_user
    redirect_to root_path, alert: 'You have to signed in/up first!'
  end
end



