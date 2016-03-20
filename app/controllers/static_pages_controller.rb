class StaticPagesController < ApplicationController
    skip_before_action :authorize_user!
    
    def home
    end
end


