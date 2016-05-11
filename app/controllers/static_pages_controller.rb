class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      redirect_to alerts_path
    end
    # @products =
  end

  def help
  end

  def about
  end
  
  def contact
  end
end
