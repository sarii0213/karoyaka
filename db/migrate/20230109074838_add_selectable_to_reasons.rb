class AddSelectableToReasons < ActiveRecord::Migration[7.0]
  def change
    add_column :reasons, :selectable, :boolean, default: true
  end
end
