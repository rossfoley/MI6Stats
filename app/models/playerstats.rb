class Playerstats < ActiveRecord::Base
  self.table_name = "tbl_playerstats"

  scope :all_with_names, select("`tbl_playerstats`.*, `tbl_playerdata`.SoldierName").joins("INNER JOIN tbl_server_player USING(StatsID) INNER JOIN tbl_playerdata USING(PlayerID)")
end
