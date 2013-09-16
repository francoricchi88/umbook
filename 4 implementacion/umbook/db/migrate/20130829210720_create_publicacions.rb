class CreatePublicacions < ActiveRecord::Migration
  def change
    create_table :publicacions do |t|
      t.string :autor
      t.string :contenido
      t.references :usuario 	

      t.timestamps
    end
  end
end
