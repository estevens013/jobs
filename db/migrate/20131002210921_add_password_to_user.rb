class AddPasswordToUser < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :confirmPassword, :string
  end
end
