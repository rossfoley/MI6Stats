class Shotgun < ActiveRecord::Base
  extend WeaponExtensions

  self.table_name = "tbl_weapons_shotgun"
  WEAPONS = ["870MCS", "DAO-12", "USAS-12", "Siaga20k", "M1014", "M26Mass"]  
end
