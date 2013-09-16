class CreateNotificacions < ActiveRecord::Migration
  def change
    create_table :notificacions do |t|
      t.string :autor
      t.string :contenido
      t.boolean :leido
      t.references :usuario	

      t.timestamps
    end
  end
end
