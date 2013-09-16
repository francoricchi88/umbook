class ChangeFieldsToUsuarios < ActiveRecord::Migration
  def change
	rename_column :usuarios, :password, :password_digest 
  end
end
