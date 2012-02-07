class HandgunController < ApplicationController
  def index
    @handguns = Handgun.weapon_sums
  end
end
