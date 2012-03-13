class PlayerstatsController < ApplicationController
  def index
    @players = Playerstats.all_with_names.order("Score DESC").page(params[:page])
    @graph_data = Playerstats.create_bar_graph_data
  end

  def headshots
    @players = Playerstats.all_with_names.order("Score DESC").page(params[:page])
    @graph_data = Playerstats.create_bar_graph_data
  end

  def table
    @players = Playerstats.all_with_names.order("Score DESC").limit(100)
    render layout: "blank"
  end
end
