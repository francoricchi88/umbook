class AddRememberTokenToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :remember_token, :string
  end
end
