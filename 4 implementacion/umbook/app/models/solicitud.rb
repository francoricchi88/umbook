class Solicitud < ActiveRecord::Base
	belongs_to :usuario_receptor, class_name: "Usuario"
	#belongs_to :usuario_emisor, class_name: 'Usuario'

end
