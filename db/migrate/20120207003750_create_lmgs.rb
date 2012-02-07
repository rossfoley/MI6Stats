class CreateLmgs < ActiveRecord::Migration
  def change
    create_table :lmgs do |t|

      t.timestamps
    end
  end
end
