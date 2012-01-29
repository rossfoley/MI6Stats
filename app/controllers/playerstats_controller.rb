class PlayerstatsController < ApplicationController
  def index
    @players = Playerstats.all_with_names.order("Score DESC").page(params[:page])
    @pie_data = Playerstats.create_pie_graph_data
  end

  def table
    @players = Playerstats.all_with_names.order("Score DESC").limit(100)
    render layout: "blank"
  end
end
