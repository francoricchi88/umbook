class SesionesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @usuario=Usuario.find_by_mail(params[:usuario][:mail])

    if @usuario and @usuario.authenticate(params[:usuario][:password])
      sign_in @usuario	
      redirect_to usuarios_home_path

    else
      flash[:notice]='El usuario o password son incorrectos'
      redirect_to root_url
    end		
  end

  def destroy
    cookies[:remember_token] = nil
    flash[:successful] = "Usted ha salido"
    current_usuario = nil
    redirect_to root_url
  end

end
