class CreateExplosives < ActiveRecord::Migration
  def change
    create_table :explosives do |t|

      t.timestamps
    end
  end
end
