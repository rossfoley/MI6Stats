class PlayerstatsController < ApplicationController

  include ActionView::Helpers::NumberHelper

  QUERY = "SELECT `tbl_playerstats`.*, `tbl_playerdata`.SoldierName FROM `tbl_playerstats` INNER JOIN tbl_server_player ON tbl_playerstats.StatsID = tbl_server_player.StatsID JOIN tbl_playerdata ON tbl_server_player.PlayerID = tbl_playerdata.PlayerID"

  def index
    @players = Playerstats.find_by_sql(QUERY)

    total_players = @players.count
    headshot_data = Playerstats.count(:group => "FLOOR(Headshots/10)")
    categories = headshot_data.map { |k, v| "'#{k*10}-#{k*10+9}'" }.join(", ")
    values = headshot_data.map { |k, v| "#{number_with_precision((v*100.0)/total_players, :precision => 2)}" }.join(", ")
    @graph_categories = "[#{categories}]"
    @graph_data = "[#{values}]"
  end
end
