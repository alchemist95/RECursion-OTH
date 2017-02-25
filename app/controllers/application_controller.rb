class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user
  helper_method :current_score
  helper_method :authenticate_user!

  rescue_from CanCan::AccessDenied do | exception |
    redirect_to '/error', alert: exception.message
  end


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private

   def authenticate
     if !current_user
       flash[:error] = "Please Sign In"
       redirect_to root_path
     end
  end



  def current_score
  	if current_user == nil
      @current_score = 0
    else
      @current_score = current_user.score
    end
    @current_score
  end


end
