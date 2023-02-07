class CreateReasonWayOptimalities < ActiveRecord::Migration[7.0]
  def change
    create_table :reason_way_optimalities do |t|
      t.references :reason, null: false, foreign_key: true
      t.references :letting_go_way, null: false, foreign_key: true
      t.decimal :score, precision: 3, scale: 2

      t.timestamps
      t.index [ :reason_id, :letting_go_way_id ], name: :reason_way_id_uniqueness, unique: true
    end
  end
end
