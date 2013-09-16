class ComentariosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :signed_in_user
  
  def create
    @usuario=current_usuario
    @publicacion=Publicacion.find(params[:comentario][:publicacion_id])
    @publicacion.comentarios.create(autor: (@usuario.nombre + " "+ @usuario.apellido),contenido: params[:comentario][:contenido] )

    if @publicacion.usuario.id.equal?(@usuario.id) 
      redirect_to '/usuarios/home'
    else
      redirect_to '/usuarios/show/'+@publicacion.usuario.id.to_s
    end

  end
end
