class Explosives < ActiveRecord::Base
  extend WeaponExtensions

  self.table_name = "tbl_weapons_explosive"
  WEAPONS = ["C4", "Claymore", "M15_AT_mine", "M67"]  
end
