class ProductsController < ApplicationController
  def show
    @product=Product.find_by_staples_pid(params[:staples_pid])
  end

end
