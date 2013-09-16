class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :autor
      t.string :contenido
      t.references :publicacion	

      t.timestamps
    end
  end
end
