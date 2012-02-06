class AssaultrifleController < ApplicationController
  def index
    @assault = AssaultRifle.weapon_sums
  end
end
