class MapstatsController < ApplicationController
  def index
    @mapstats = Mapstats.all
    @map_avg = create_graph_array "AvgPlayers"
    @map_left = create_graph_array "PlayersLeftServer"
    @map_joined = create_graph_array "PlayersJoinedServer"
  end

  private

  def create_graph_array(col)
    map_data = Mapstats.average(col, :group => "MapName").reject {|k, v| k.empty? }
    {categories: "[#{map_data.map {|k, v| "'#{Mapstats::MAPS[k]}'"}.join(", ")}]",
     data: "[#{map_data.map {|k, v| (v*10).round/10.0}.join(", ")}]"}
  end
end
