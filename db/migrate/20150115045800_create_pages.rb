class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :description
      t.text :advantages
      t.text :warnings

      t.timestamps null: false
    end
  end
end
