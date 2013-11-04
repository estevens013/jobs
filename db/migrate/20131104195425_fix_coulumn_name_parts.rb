class FixCoulumnNameParts < ActiveRecord::Migration
  def up
  	rename_column :parts, :partQunatity, :partQuantity
  end

  def down
  end
end
