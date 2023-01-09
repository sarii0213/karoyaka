class AddSelectableToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :selectable, :boolean, default: true
  end
end
