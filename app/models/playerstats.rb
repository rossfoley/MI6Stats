class Playerstats < ActiveRecord::Base
  self.table_name = "tbl_playerstats"

  scope :all_with_names, select("`tbl_playerstats`.*, `tbl_playerdata`.SoldierName").joins("INNER JOIN tbl_server_player USING(StatsID) INNER JOIN tbl_playerdata USING(PlayerID)")

  def spm
    self.Score / (self.Playtime / 60)
  end

  def kdr
    self.Kills / (self.Deaths * 1.0)
  end

  def headshot_percent
    (10.0 * self.Headshots) / self.Kills
  end

  def self.create_pie_graph_data
    headshot_counts = self.count(group: "FLOOR(Headshots/10)")
    data = headshot_counts.map { |k, v| "['#{k*10}-#{k*10+9}', #{v}]" }.join(", ")
    "[#{data}]"
  end
end
