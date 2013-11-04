class FixCoulumnNamesParts < ActiveRecord::Migration
  def up
  	rename_column :parts, :itemNumber, :partNumber
  	rename_column :parts, :itemQunatity, :partQunatity
  end

  def down
  end
end
