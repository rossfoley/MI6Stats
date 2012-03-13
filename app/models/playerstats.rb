class Playerstats < ActiveRecord::Base
  self.table_name = "tbl_playerstats"

  HEADSHOT_GROUPS = "CASE WHEN Headshots >= 0 AND Headshots <= 10 THEN '0-10' WHEN Headshots >= 11 AND Headshots <= 50 THEN '11-50' WHEN Headshots >= 51 AND Headshots <= 100 THEN '51-100' WHEN Headshots >= 101 AND Headshots <= 200 THEN '100-200' ELSE '200+' END"

  scope :all_with_names, 
    select("`tbl_playerstats`.*, `tbl_playerdata`.SoldierName, `tbl_playerdata`.CountryCode, #{HEADSHOT_GROUPS} as headshot_range")
    .joins("INNER JOIN tbl_server_player USING(StatsID) INNER JOIN tbl_playerdata USING(PlayerID)")

  HEADSHOT_QUERY = "SELECT h.headshot_range, COUNT(h.headshot_range) AS headshot_count FROM (SELECT #{HEADSHOT_GROUPS} as headshot_range FROM tbl_playerstats) as h GROUP BY h.headshot_range"


  def spm
    self.Score / (self.Playtime / 60)
  end

  def kdr
    self.Kills / (self.Deaths * 1.0)
  end

  def headshot_percent
    (100.0 * self.Headshots) / self.Kills
  end

  def self.create_bar_graph_data
    data, categories = [], []
    headshot_counts = self.find_by_sql(HEADSHOT_QUERY)

    headshot_counts.sort! do |a, b|
      a_int = a.headshot_range.match(/(\d+)/).to_s.to_i 
      b_int = b.headshot_range.match(/(\d+)/).to_s.to_i
      a_int <=> b_int
    end

    headshot_counts.map do |k, v| 
      categories << "'#{k.headshot_range}'"
      data << k.headshot_count.to_s
    end

    {data: "[#{data.join(", ")}]", categories: "[#{categories.join(", ")}]"}
  end
end
