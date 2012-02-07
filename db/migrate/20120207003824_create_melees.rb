class CreateMelees < ActiveRecord::Migration
  def change
    create_table :melees do |t|

      t.timestamps
    end
  end
end
