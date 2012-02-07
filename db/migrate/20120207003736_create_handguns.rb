class CreateHandguns < ActiveRecord::Migration
  def change
    create_table :handguns do |t|

      t.timestamps
    end
  end
end
