class CreateTickers < ActiveRecord::Migration
  def change
    create_table :tickers do |t|
      t.string :symbol, null: false
      t.string :name, null: false
      t.string :sector
      t.float :price
      t.float :daily_change
      t.float :daily_change_abs
      t.string :market_cap
      t.integer :market_cap_num, :limit => 8
      t.float :pe
      t.float :peb
      t.float :pe_peb_avg
      t.float :volume
      t.float :volume_avg
      t.float :volume_cmp
      t.float :mov_avg_50
      t.float :mov_avg_50_cmp
      t.float :mov_avg_200
      t.float :high_52
      t.float :low_52
      t.float :beta
      t.float :daily_annual_change_avg

      t.timestamps null: false
    end
  end
end
