class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :customername

      t.timestamps
    end
  end
end
