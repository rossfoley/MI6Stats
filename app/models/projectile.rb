class Projectile < ActiveRecord::Base
  extend WeaponExtensions

  self.table_name = "tbl_weapons_projectileexplosive"
  WEAPONS = ["Sa18IGLA", "FIM92", "M320", "RPG-7", "FGM-148", "SMAW"]  
end
