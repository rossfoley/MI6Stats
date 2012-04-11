class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|

      t.timestamps
    end
  end
end
