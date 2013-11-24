class AddRedSbToAlquiler < ActiveRecord::Migration
  def change
  	add_column :alquilers, :sb_red, :integer  	
  end
end
