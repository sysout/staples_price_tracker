class ProductsController < ApplicationController
  def show
    @product=Product.eager_load(:price_histories).find_by_staples_pid(params[:staples_pid])
  end

end
