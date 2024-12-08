class AddUnitToDirectorate < ActiveRecord::Migration[7.1]
  def change
    add_column :directorates, :unit, :boolean
  end
end
