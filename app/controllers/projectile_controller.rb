class ProjectileController < ApplicationController
  def index
    @projectiles = Projectile.weapon_sums
  end
end
