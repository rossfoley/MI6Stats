class AssaultRifle < ActiveRecord::Base
  extend WeaponExtensions

  self.table_name = "tbl_weapons_assaultrifle"
  WEAPONS = ["FAMAS", "AS_Val", "M16A4", "KH2002", "AN-94_Abakan", "M416", "AK74M", "G3A3", "F2000", "AEK-971", "HK53", "QBZ-95", "L85A2"] 
end
