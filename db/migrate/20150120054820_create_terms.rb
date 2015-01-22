class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :name
      t.text :definition
      t.text :example

      t.timestamps null: false
    end
  end
end
