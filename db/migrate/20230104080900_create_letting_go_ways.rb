class CreateLettingGoWays < ActiveRecord::Migration[7.0]
  def change
    create_table :letting_go_ways do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps
      t.index :name, unique: true
    end
  end
end