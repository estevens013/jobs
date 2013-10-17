class FixHashColumnName < ActiveRecord::Migration
  def up
  	rename_column :users, :password_confirmation, :password_hash
  end

  def down
  end
end
