class AddAbonoToAlquiler < ActiveRecord::Migration
  def change
    add_column :alquilers, :abono, :integer
    add_column :alquilers, :status, :boolean, :default => false
  end
end
