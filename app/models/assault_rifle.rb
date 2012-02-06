class AssaultRifle < ActiveRecord::Base
  self.table_name = "tbl_weapons_assaultrifle"

  WEAPONS = ["FAMAS", "AS_Val", "M16A4", "KH2002", "AN-94_Abakan", "M416", "AK74M", "G3A3", "F2000", "AEK-971", "HK53", "QBZ-95", "L85A2"] 

  def self.weapon_sums
    query = WEAPONS.map do |weapon|
      "SUM(`#{weapon}_kills`) AS `#{weapon}_kills`, SUM(`#{weapon}_hs`) AS `#{weapon}_hs`, SUM(`#{weapon}_deaths`) AS `#{weapon}_deaths`"
    end.join(", ")

    self.select(query).first
  end
end
