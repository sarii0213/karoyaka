class CreateCategoryWayOptimalities < ActiveRecord::Migration[7.0]
  def change
    create_table :category_way_optimalities do |t|
      t.references :category, null: false, foreign_key: true
      t.references :letting_go_way, null: false, foreign_key: true
      t.decimal :score, precision: 3, scale: 2

      t.timestamps
      t.index [ :category_id, :letting_go_way_id ], name: :category_way_id_uniqueness, unique: true
    end
  end
end