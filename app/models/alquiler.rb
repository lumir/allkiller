class Alquiler < ActiveRecord::Base
   attr_accessible :name, :identifier, :address, :phone, :chairs, :tables, :big_tables, :tablecloth, :big_tablecloth, :deliver_date, :total, :abono, :status 

   AMMOUNT = {chairs: 800, tables: 37, big_tables: 64, tablecloth: 50, big_tablecloth: 20, small_chairs: 100, sb_green: 20, sb_yellow: 20, sb_pink: 20, chaircloth: 20}
   PRICES = {chairs: 500, tables: 1000, big_tables: 2000, tablecloth: 2000, big_tablecloth: 3000, small_chairs: 400, chaircloth: 1000, sb_green: 1000, sb_yellow: 1000, sb_pink: 1000}

   def self.get_available(date)
      available_chairs = AMMOUNT[:chairs] - self.sum(:chairs, conditions: {:deliver_date => date})      
      available_small_chairs = AMMOUNT[:small_chairs] - self.sum(:small_chairs, conditions: {:deliver_date => date})      
      available_tables = AMMOUNT[:tables] - self.sum(:tables, conditions: {:deliver_date => date})      
      available_big_tables = AMMOUNT[:big_tables] - self.sum(:big_tables, conditions: {:deliver_date => date})      
      available_tablecloth = AMMOUNT[:tablecloth] - self.sum(:tablecloth, conditions: {:deliver_date => date})      
      available_big_tablecloth = AMMOUNT[:big_tablecloth] - self.sum(:big_tablecloth, conditions: {:deliver_date => date})
      available_chaircloth = AMMOUNT[:chaircloth] - self.sum(:chaircloth, conditions: {:deliver_date => date})            
      available_sb_green = AMMOUNT[:sb_green] - self.sum(:sb_green, conditions: {:deliver_date => date})                  
      available_sb_yellow = AMMOUNT[:sb_yellow] - self.sum(:sb_yellow, conditions: {:deliver_date => date})                  
      available_sb_pink = AMMOUNT[:sb_pink] - self.sum(:sb_pink, conditions: {:deliver_date => date})                  

      {
         sillas: available_chairs, 
         mesitas: available_tables, 
         mesones: available_big_tables,          
         "manteles sencillos" =>  available_tablecloth, 
         "manteles grandes" => available_big_tablecloth,          
         "sillas pequenas" => available_small_chairs,
         "forros de sillas" => available_chaircloth,
         "manteles verdes" => available_sb_green,
         "manteles amarillos" => available_sb_yellow,
         "manteles fuscias" => available_sb_pink
      }   
   end
end
