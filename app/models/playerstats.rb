class Playerstats < ActiveRecord::Base
  self.table_name = "tbl_playerstats"

  scope :all_with_names, select("`tbl_playerstats`.*, `tbl_playerdata`.SoldierName").joins("INNER JOIN tbl_server_player ON tbl_playerstats.StatsID = tbl_server_player.StatsID INNER JOIN tbl_playerdata ON tbl_server_player.PlayerID = tbl_playerdata.PlayerID")
end
