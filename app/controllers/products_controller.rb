class ProductsController < ApplicationController
  def show
    @product=Product.find_by_staples_pid(params[:staples_pid])
    if not @product
      redirect_to root_url, notice: "Page not found!"
    end
  end

end
