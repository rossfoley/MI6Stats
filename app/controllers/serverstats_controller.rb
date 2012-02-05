class ServerstatsController < ApplicationController
  def index
    @server = Serverstats.first
  end
end
