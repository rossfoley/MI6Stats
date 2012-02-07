class CreateSnipers < ActiveRecord::Migration
  def change
    create_table :snipers do |t|

      t.timestamps
    end
  end
end
