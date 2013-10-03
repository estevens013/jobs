class FixColumnName < ActiveRecord::Migration
  def up
  	rename_column :users, :confirmPassword, :password_confirmation
  end

  def down
  end
end
