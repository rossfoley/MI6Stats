class CreateSmgs < ActiveRecord::Migration
  def change
    create_table :smgs do |t|

      t.timestamps
    end
  end
end
