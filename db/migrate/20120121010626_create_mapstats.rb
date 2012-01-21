class CreateMapstats < ActiveRecord::Migration
  def change
    create_table :mapstats do |t|

      t.timestamps
    end
  end
end
