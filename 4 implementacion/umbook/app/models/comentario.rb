class Comentario < ActiveRecord::Base
	belongs_to :publicacion
	validates :contenido, presence: true 
end
