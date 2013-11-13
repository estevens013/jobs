class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :documentName
      t.string :documentDescription
      t.string :documentType
      t.string :documentSize

      t.timestamps
    end
  end
end
