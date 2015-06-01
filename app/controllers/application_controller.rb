class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include AdminSessionsHelper
  before_action :set_background

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_background

  	background_image = SiteImage.where(reference:"background_image")
    if (background_image != [])
      baseCloudinaryURL = 'http://res.cloudinary.com/shefuniathletics/image/upload/'
      @backgroundImageURL = baseCloudinaryURL+SiteImage.find_by(reference: "background_image").image_url
    else
      @background_image =  ""
    end

  	
  end

  helper_method :current_user
end
