class StaticPagesController < ApplicationController
  
  def home
    @products = Product.where('alerts_count > 0').order(alerts_count: :desc)
  end

  def help
  end

  def about
  end
  
  def contact
  end
end
