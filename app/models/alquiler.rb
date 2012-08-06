class Alquiler < ActiveRecord::Base
   attr_accessible :name, :identifier, :address, :phone, :chairs, :tables, :big_tables, :tablecloth, :big_tablecloth, :deliver_date, :total 

   AMMOUNT = {chairs: 700, tables: 40, big_tables: 80, tablecloth: 40, big_tablecloth: 40 } 
   PRICES = {chairs: 500, tables: 500, big_tables: 2000, tablecloth: 1500, big_tablecloth: 3000 }

   def self.get_available(date)
      available_chairs = AMMOUNT[:chairs] - self.sum(:chairs, conditions: {:deliver_date => Date.today})      
      available_tables = AMMOUNT[:tables] - self.sum(:tables, conditions: {:deliver_date => Date.today})      
      available_big_tables = AMMOUNT[:big_tables] - self.sum(:big_tables, conditions: {:deliver_date => Date.today})      
      available_tablecloth = AMMOUNT[:tablecloth] - self.sum(:tablecloth, conditions: {:deliver_date => Date.today})      
      available_big_tablecloth = AMMOUNT[:big_tablecloth] - self.sum(:big_tablecloth, conditions: {:deliver_date => Date.today})      
      {sillas: available_chairs, "manteles_sencillos" =>  available_tablecloth,  mesones: available_big_tables, "manteles_sencillos" =>  available_tablecloth, "manteles grandes" => available_big_tablecloth, mesitas: available_tables }   
   end
end
