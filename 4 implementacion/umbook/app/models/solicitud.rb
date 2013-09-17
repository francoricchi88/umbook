class Solicitud < ActiveRecord::Base
	belongs_to :usuario
	#belongs_to :usuario_emisor, class_name: 'Usuario'

end
