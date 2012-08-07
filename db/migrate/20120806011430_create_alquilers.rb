class CreateAlquilers < ActiveRecord::Migration
  def change
    create_table :alquilers do |t|
      t.string :name
      t.string :identifier      
      t.string :address
      t.string :phone
      t.date :deliver_date
      t.integer :chairs
      t.integer :tables
      t.integer :big_tables
      t.integer :tablecloth
      t.integer :big_tablecloth
      t.integer :total
      t.timestamps
    end
  end
end
