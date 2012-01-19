class PlayerstatsController < ApplicationController
  def index
    @players = Playerstats.find_by_sql("SELECT `tbl_playerstats`.*, `tbl_playerdata`.SoldierName FROM `tbl_playerstats` INNER JOIN tbl_server_player ON tbl_playerstats.StatsID = tbl_server_player.StatsID JOIN tbl_playerdata ON tbl_server_player.PlayerID = tbl_playerdata.PlayerID")
    @player_graph = "[" + Playerstats.count(:group => "Headshots", :order => "Headshots ASC").map { |k, v| "[#{k}, #{v}]" }.join(", ") + "]"
  end
end
