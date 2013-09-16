class Notificacion < ActiveRecord::Base
	has_many :comentarios
	belongs_to :usuario	
end
