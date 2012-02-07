class ExplosivesController < ApplicationController
  def index
    @explosives = Explosives.weapon_sums
  end
end
