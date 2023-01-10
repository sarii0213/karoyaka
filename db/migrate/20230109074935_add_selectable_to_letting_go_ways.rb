class AddSelectableToLettingGoWays < ActiveRecord::Migration[7.0]
  def change
    add_column :letting_go_ways, :selectable, :boolean, default: true
  end
end
