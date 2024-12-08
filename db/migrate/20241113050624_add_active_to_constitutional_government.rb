class AddActiveToConstitutionalGovernment < ActiveRecord::Migration[7.1]
  def change
    add_column :constitutional_governments, :active, :boolean
  end
end
