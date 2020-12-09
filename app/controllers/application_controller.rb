class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  
	protected #para no hacer ataque crcf
	
	def current_user # solo  funciona cuando sea nill
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  # def logged?
  #   session[:user_id].present?
  # end
end
