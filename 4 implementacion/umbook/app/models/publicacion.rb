class Publicacion < ActiveRecord::Base
	belongs_to :usuario
	has_many :comentarios
	validates :contenido , presence: true
end
