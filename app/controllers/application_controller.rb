class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :myself_image

  protect_from_forgery  with: :exception
  add_flash_types :success, :info, :warning, :danger

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def myself_image
    if current_user
      @my_image = MyImage.find_by(user_id: current_user.id)
    end
  end
end
