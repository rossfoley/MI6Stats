class MapstatsController < ApplicationController
  def index
    @mapstats = Mapstats.all
  end
end
