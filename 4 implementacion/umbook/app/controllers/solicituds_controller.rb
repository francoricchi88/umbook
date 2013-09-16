class SolicitudsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :signed_in_user

  def create	 

    @usuario_receptor=Usuario.find(params[:solicitud][:id_receptor])
    @usuario_receptor.solicituds.create(ref:current_usuario.id)
    redirect_to '/usuarios/show/'+@usuario_receptor.id.to_s
  end
  def accept
    @solicitud= Solicitud.where("usuario_id like ? and ref like ?",current_usuario.id, params[:solicitud][:id_emisor])	
    @solicitud.first.destroy
    @usuario_receptor=current_usuario
    @usuario_emisor=Usuario.find(params[:solicitud][:id_emisor])
    @usuario_receptor.amistads.create(amigo: @usuario_emisor.id )
    @usuario_emisor.amistads.create(amigo:@usuario_receptor.id )
    redirect_to '/usuarios/show/'+@usuario_emisor.id.to_s

  end
end
