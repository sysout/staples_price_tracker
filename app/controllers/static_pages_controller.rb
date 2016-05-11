class StaticPagesController < ApplicationController
  
  def home
    @products = Product.where('alerts_count > 0').order(alerts_count: :desc).paginate(page: params[:page], :per_page => 10)
  end

  def help
  end

  def about
  end
  
  def contact
  end
end
