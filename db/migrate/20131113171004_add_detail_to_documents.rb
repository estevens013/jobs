class AddDetailToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :job_id, :integer
  end
end
