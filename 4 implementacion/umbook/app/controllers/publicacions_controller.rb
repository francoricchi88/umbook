class PublicacionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :signed_in_user

  def create
    @usuario=Usuario.find(params[:publicacion][:usuario_id])
    @usuario_que_publico=current_usuario	
    @usuario.publicacions.create(autor: (@usuario_que_publico.nombre + " "+ @usuario_que_publico.apellido),contenido: params[:publicacion][:contenido] )

    if @usuario.id.equal?(@usuario_que_publico.id)
      redirect_to '/usuarios/home/'
    else	
      redirect_to '/usuarios/show/'+@usuario.id.to_s	
    end

  end	

end
