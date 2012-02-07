class Lmg < ActiveRecord::Base
  extend WeaponExtensions

  self.table_name = "tbl_weapons_lmg"
  WEAPONS = ["M249", "M60", "Type88", "RPK-74M", "M240", "QBB-95", "PP-19", "Pecheneg", "M27IAR", "MG36"]  
end
