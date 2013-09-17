class PublicacionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :signed_in_user

  def create
    @usuario=Usuario.find(params[:publicacion][:usuario_id])
    @usuario_que_publico=current_usuario	
    publicacion= Publicacion.new(autor: @usuario_que_publico.to_s,contenido: params[:publicacion][:contenido])  
    publicacion.usuario= @usuario
    publicacion.save
    if @usuario.id.equal?(@usuario_que_publico.id)
      redirect_to '/usuarios/home/'
    else	
      redirect_to '/usuarios/show/'+@usuario.id.to_s	
    end

  end	

end
