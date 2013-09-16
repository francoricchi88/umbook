class CreateAmistads < ActiveRecord::Migration
  def change
    create_table :amistads do |t|
      t.integer :amigo		
      t.references :usuario 
      t.timestamps
    end
  end
end
