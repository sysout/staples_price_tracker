class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

  before_filter :redirect_to_prefered_host

  private
  def redirect_to_prefered_host
    if Rails.env.production? && request.host != ENV['APP_HOST_NAME']
      redirect_to(:host => ENV['APP_HOST_NAME'])
    end
  end

end
