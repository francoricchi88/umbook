require 'date'
class UsuariosController < ApplicationController
  before_filter :signed_in_user, only: [:home, :show, :search]	

  def index
    redirect_to action: "home" if signed_in?
  end

  def home
  end

  def new
  end

  def create
    fecha_nacimiento= Date.new(params[:usuario]["fecha_nacimiento(1i)"].to_i,params[:usuario]["fecha_nacimiento(2i)"].to_i,params[:usuario]["fecha_nacimiento(3i)"].to_i)
    @usuario= Usuario.new(nombre: params[:usuario][:nombre], apellido: params[:usuario][:apellido], mail: params[:usuario][:email], password: params[:usuario][:password],password_confirmation:params[:usuario][:password_confirmation], sexo: params[:usuario][:sexo], pregunta_secreta: params[:usuario][:pregunta_secreta], respuesta_secreta: params[:usuario][:respuesta_secreta], fecha_nacimiento: fecha_nacimiento )
    if @usuario.save
      flash[:successful]="Ahora puedes loguearte"
      redirect_to root_url

    else	

      render 'new'

    end

  end

  def search
    usuarioid=0

    @usuario=current_usuario
    @usuarios=[]
    params[:usuario][:contenido].split.each do |palabra|
      Usuario.where("nombre like ? or apellido like ?",palabra,palabra).each do |usuario|
        if usuario.id.equal? @usuario.id
        else
          if usuarioid.equal?(usuario.id)
          else
            @usuarios.push(usuario)
            usuarioid=usuario.id	
          end	

        end
      end	
    end



  end

  def show


    @usuario=current_usuario
    @usuario_amigo= Usuario.find(params[:id])
    if @usuario.id.equal?(@usuario_amigo.id)
      redirect_to action: 'home'
    end

  end

end
