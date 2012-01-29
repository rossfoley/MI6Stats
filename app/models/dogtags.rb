class Dogtags < ActiveRecord::Base
  self.table_name = "tbl_dogtags"

  scope :all_with_names, select("tbl_dogtags.*, k.SoldierName AS Killer, v.SoldierName AS Victim").joins("INNER JOIN tbl_server_player a ON a.StatsID = tbl_dogtags.KillerID INNER JOIN tbl_playerdata k ON k.PlayerID = a.PlayerID INNER JOIN tbl_server_player b ON b.StatsID = tbl_dogtags.VictimID INNER JOIN tbl_playerdata v ON v.PlayerID = b.PlayerID")

  def self.top_players
    self.all_with_names.limit(25).sum("Count", group: "k.SoldierName", order: "SUM(Count) DESC")
  end
end
