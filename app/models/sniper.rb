class Sniper < ActiveRecord::Base
  extend WeaponExtensions

  self.table_name = "tbl_weapons_sniperrifle"
  WEAPONS = ["Model98B", "M39", "L96", "SVD", "QBU-88", "MK11", "SV98", "SKS", "M40A5"]  
end
