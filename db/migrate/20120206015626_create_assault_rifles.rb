class CreateAssaultRifles < ActiveRecord::Migration
  def change
    create_table :assault_rifles do |t|

      t.timestamps
    end
  end
end
