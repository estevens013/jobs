class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :fullname
      t.string :email
      t.string :customer
      t.string :admin

      t.timestamps
    end
  end
end
