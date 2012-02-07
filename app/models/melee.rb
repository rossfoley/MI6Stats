class Melee < ActiveRecord::Base
  extend WeaponExtensions

  self.table_name = "tbl_weapons_melee"
  WEAPONS = ["Repair_Tool", "Defib", "Knife"] 
end
