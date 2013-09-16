class CreateSolicituds < ActiveRecord::Migration
  def change
    create_table :solicituds do |t|
	t.references :usuario
	t.integer :ref		
        t.timestamps
    end	
     		
  end
end
