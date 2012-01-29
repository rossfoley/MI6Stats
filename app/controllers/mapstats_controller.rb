class MapstatsController < ApplicationController
  def index
    @mapstats = Mapstats.order("TimeRoundStarted DESC").page(params[:page])
    @categories = create_graph_categories
    @total = create_graph_array "AvgPlayers"
    @left = create_graph_array "PlayersLeftServer"
    @joined = create_graph_array "PlayersJoinedServer"
  end

  private

  def create_graph_array(col)
    map_data = get_averages(col)
    "[#{map_data.map {|k, v| (v*10).round/10.0}.join(", ")}]"
  end

  def create_graph_categories
    map_data = get_averages("AvgPlayers")
    "[#{map_data.map {|k, v| "'#{Mapstats::MAPS[k]}'"}.join(", ")}]"
  end

  def get_averages(col)
    Mapstats.average(col, :group => "MapName").reject {|k, v| k.empty? }
  end
end
