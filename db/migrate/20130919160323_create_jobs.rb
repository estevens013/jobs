class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :purchaseOrder
      t.string :customer
      t.string :owner
      t.string :internalOwner
      t.string :status
      t.date :modified
      t.date :due

      t.timestamps
    end
  end
end
