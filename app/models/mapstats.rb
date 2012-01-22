class Mapstats < ActiveRecord::Base
  self.table_name = "tbl_mapstats"

  MAPS = {"MP_001" => "Grand Bazaar",
          "MP_003" => "Tehran Highway",
          "MP_007" => "Caspian Border",
          "MP_011" => "Seine Crossing",
          "MP_012" => "Operation Firestorm",
          "MP_013" => "Damavand Peak",
          "MP_017" => "Noshahr Canals",
          "MP_018" => "Kharg Island",
          "MP_Subway" => "Operation Metro",
          "XP1_001" => "Strike at Karkand",
          "XP1_002" => "Gulf of Oman",
          "XP1_003" => "Sharqi Peninsula",
          "XP1_004" => "Wake Island"}
  
  MODES = {"ConquestLarge0" => "Conquest Large",
           "ConquestSmall0" => "Conquest Small",
           "ConquestSmall1" => "Conquest Assault #2",
           "RushLarge0" => "Rush",
           "SquadRush0" => "Squad Rush",
           "TeamDeathMatch0" => "Team Deathmatch",
           "SquadDeathMatch0" => "Squad Deathmatch"}

  def full_map_title
    readable_map_name + " - " + readable_game_mode
  end

  def readable_map_name
    MAPS[self.MapName] || "None"
  end

  def readable_game_mode
    MODES[self.Gamemode] || "None"
  end
end
