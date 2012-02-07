class SniperController < ApplicationController
  def index
    @sniper = Sniper.weapon_sums
  end
end
