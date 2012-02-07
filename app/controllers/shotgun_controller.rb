class ShotgunController < ApplicationController
  def index
    @shotguns = Shotgun.weapon_sums
  end
end
