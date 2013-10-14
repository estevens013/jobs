class FixColumnNameUsers < ActiveRecord::Migration
  def up
  	rename_column :users, :salt, :password_salt
  end

  def down
  end
end
