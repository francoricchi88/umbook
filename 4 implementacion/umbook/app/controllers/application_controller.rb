class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  include SesionesHelper	

  def signed_in_user
    if !signed_in?
      flash[:notice] = "Inicie sesion para continuar"
      redirect_to root_url
    end
  end
end
