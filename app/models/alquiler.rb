class Alquiler < ActiveRecord::Base
   attr_accessible :name, :identifier, :address, :phone, :chairs, :tables, :big_tables, :tablecloth, :big_tablecloth, :deliver_date, :total, :abono, :status 

   AMMOUNT = {chairs: 790, tables: 38, big_tables: 68, tablecloth: 50, big_tablecloth: 20 } 
   PRICES = {chairs: 500, tables: 1000, big_tables: 2000, tablecloth: 2000, big_tablecloth: 3000 }

   def self.get_available(date)
      available_chairs = AMMOUNT[:chairs] - self.sum(:chairs, conditions: {:deliver_date => date})      
      available_tables = AMMOUNT[:tables] - self.sum(:tables, conditions: {:deliver_date => date})      
      available_big_tables = AMMOUNT[:big_tables] - self.sum(:big_tables, conditions: {:deliver_date => date})      
      available_tablecloth = AMMOUNT[:tablecloth] - self.sum(:tablecloth, conditions: {:deliver_date => date})      
      available_big_tablecloth = AMMOUNT[:big_tablecloth] - self.sum(:big_tablecloth, conditions: {:deliver_date => date})      
      {sillas: available_chairs, "manteles_sencillos" =>  available_tablecloth,  mesones: available_big_tables, "manteles_sencillos" =>  available_tablecloth, "manteles grandes" => available_big_tablecloth, mesitas: available_tables }   
   end
end
