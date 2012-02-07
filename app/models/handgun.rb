class Handgun < ActiveRecord::Base
  extend WeaponExtensions

  self.table_name = "tbl_weapons_handgun"
  WEAPONS = ["MP443", "Taurus_44", "M9", "MP412Rex", "M1911", "M93R", "GLOCK18"]  
end
