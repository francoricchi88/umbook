class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido
      t.string :mail
      t.string :password
      t.string :sexo
      t.string :pregunta_secreta
      t.date :fecha_nacimiento
      t.string :respuesta_secreta
      t.string :rol
      t.string :estado
      t.string :foto_perfil
     	

      t.timestamps
    end
  end
end
