class Usuario < ActiveRecord::Base
  has_secure_password	
  has_many :amistads

  has_many :solicituds

  has_many :notificacions
  has_many :publicacions
  validates :nombre, :apellido,:mail, :sexo, :pregunta_secreta, :respuesta_secreta, :fecha_nacimiento, presence: true
  validates :mail, uniqueness: true, format: {with: /(\w|-|_)+@(\w)+.(\w)+/ , massage: "formato de mail mal ingresado"}
  validates :password, presence: true,confirmation: true
  validates :password_confirmation, presence: true 

  def tiene_de_amigo_a (id_usuario)
    amistads.where(amigo: id_usuario).exists?
  end
  def tiene_solicitud_de (id_usuario)
    solicituds.where(ref: id_usuario).exists?
  end
  def envio_solicitud_a (id_usuario)
    usuario=Usuario.find(id_usuario)
    usuario.solicituds.where(ref: id).exists?
  end
  def Usuario.new_remember_token
    SecureRandom.urlsafe_base64
  end
  def Usuario.encrypt token

    Digest::SHA1.hexdigest(token.to_s)
  end

  def to_s
    self.nombre + " " + self.apellido
  end

  private
  def create_remember_token
    self.remember_token = Usuario.encrypt(Usuario.new_remember_token)
  end



end
