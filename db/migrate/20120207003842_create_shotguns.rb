class CreateShotguns < ActiveRecord::Migration
  def change
    create_table :shotguns do |t|

      t.timestamps
    end
  end
end
