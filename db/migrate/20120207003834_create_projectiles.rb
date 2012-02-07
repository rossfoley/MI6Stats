class CreateProjectiles < ActiveRecord::Migration
  def change
    create_table :projectiles do |t|

      t.timestamps
    end
  end
end
