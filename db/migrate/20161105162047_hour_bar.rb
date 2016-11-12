class HourBar < ActiveRecord::Migration[5.0]
  def change
    create_table :hour_bars, unsigned: true do |t|
      t.string :currency_pair, :limit => 10
      t.datetime  :time_utc
      t.column :open_p, "decimal(10,5) unsigned"
      t.column :high_p, "decimal(10,5) unsigned"
      t.column :low_p, "decimal(10,5) unsigned"
      t.column :close_p, "decimal(10,5) unsigned"
      t.timestamps

      t.index [:currency_pair, :time_utc], :unique => true
    end
  end
end
