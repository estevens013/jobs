class AddPaidToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :invoicePaid, :boolean
  end
end
