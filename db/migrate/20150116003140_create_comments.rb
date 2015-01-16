class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :ticker_id
      t.integer :user_id
      t.text :description
      t.float :stock_price

      t.timestamps null: false
    end
  end
end
