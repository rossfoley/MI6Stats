class LmgController < ApplicationController
  def index
    @lmg = Lmg.weapon_sums
  end
end
