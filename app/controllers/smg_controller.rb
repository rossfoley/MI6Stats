class SmgController < ApplicationController
  def index
    @smg = Smg.weapon_sums
  end
end
