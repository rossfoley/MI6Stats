class PlayerstatsController < ApplicationController
  def index
    @players = Playerstats.all_with_names.order("Playtime DESC")
    @pie_data = "[#{generate_pie_data}]"
  end

  def table
    @players = Playerstats.all_with_names.order("Score DESC")
    render layout: "blank"
  end

  private

  def generate_pie_data
    data = Playerstats.count(group: "FLOOR(Headshots/10)")
    data.map { |k, v| "['#{k*10}-#{k*10+9}', #{v}]" }.join(", ")
  end
end
