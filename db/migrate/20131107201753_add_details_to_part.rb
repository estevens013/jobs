class AddDetailsToPart < ActiveRecord::Migration
  def change
    add_column :parts, :partRev, :string
    add_column :parts, :partSerial, :string
    add_column :parts, :partVendorDue, :date
    add_column :parts, :partStatus, :string
    add_column :parts, :partShipDate, :date
    add_column :parts, :partTracking, :string
  end
end
