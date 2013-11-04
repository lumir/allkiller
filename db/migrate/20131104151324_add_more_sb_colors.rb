class AddMoreSbColors < ActiveRecord::Migration
  def change  	
  	add_column :alquilers, :sb_gold, :integer  	
  	add_column :alquilers, :sb_dark_blue, :integer  	
  end
end
