class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.string :author, null: false, default: '不明'
      t.string :content, null: false
      t.text :description

      t.timestamps
      t.index :content, unique: true
    end
  end
end
