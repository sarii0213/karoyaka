class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.references :reason, null: false, foreign_key: true
      t.references :letting_go_way, foreign_key: true
      t.string :type, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
