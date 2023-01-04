class DropToLetGoLists < ActiveRecord::Migration[7.0]
  def change
    drop_table :to_let_go_lists do |t|
      t.references :category, null: false, foreign_key: true
      t.string :item
      t.references :reason, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
