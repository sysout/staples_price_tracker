class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @alert = current_user.alerts.build
      @alert.build_product
      @alerts = current_user.alerts.all
    end
  end

  def help
  end

  def about
  end
  
  def contact
  end
end
