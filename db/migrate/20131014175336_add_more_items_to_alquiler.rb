class AddMoreItemsToAlquiler < ActiveRecord::Migration
  def change
  	add_column :alquilers, :small_chairs, :integer
  	add_column :alquilers, :chaircloth, :integer
  	add_column :alquilers, :sb_green, :integer  	
  	add_column :alquilers, :sb_yellow, :integer  	
  	add_column :alquilers, :sb_pink, :integer  	
  end
end
