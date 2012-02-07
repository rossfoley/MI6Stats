class Smg < ActiveRecord::Base
  extend WeaponExtensions

  self.table_name = "tbl_weapons_smg"
  WEAPONS = ["M4A1", "P90", "G36C", "PP-2000", "MP7", "SG_553_LB", "MagpulPDR", "AKS-74u", "SCAR-H", "UMP45", "A91"] 
end
