class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :itemNumber
      t.string :itemQunatity
      t.integer :job_id

      t.timestamps
    end
  end
end
