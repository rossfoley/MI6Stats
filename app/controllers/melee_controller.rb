class MeleeController < ApplicationController
  def index
    @melee = Melee.weapon_sums
  end
end
