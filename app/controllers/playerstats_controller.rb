class PlayerstatsController < ApplicationController

  include ActionView::Helpers::NumberHelper

  QUERY = "SELECT `tbl_playerstats`.*, `tbl_playerdata`.SoldierName FROM `tbl_playerstats` INNER JOIN tbl_server_player ON tbl_playerstats.StatsID = tbl_server_player.StatsID JOIN tbl_playerdata ON tbl_server_player.PlayerID = tbl_playerdata.PlayerID"

  def index
    @players = Playerstats.find_by_sql(QUERY)

    headshot_data = Playerstats.count(:group => "FLOOR(Headshots/10)")
    @pie_data = "[#{generate_pie_data(headshot_data)}]"
  end

  def table
    @players = Playerstats.find_by_sql(QUERY)
  end

  private

  def generate_pie_data(data)
    data.map { |k, v| "['#{k*10}-#{k*10+9}', #{v}]" }.join(", ")
  end

  def generate_categories(data)
    data.map { |k, v| "'#{k*10}-#{k*10+9}'" }.join(", ")
  end

  def generate_values(data, total_players)
    data.map { |k, v| "#{number_with_precision((v*100.0)/total_players, :precision => 2)}" }.join(", ")
  end
end
