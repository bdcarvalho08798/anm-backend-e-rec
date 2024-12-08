class AddNatdirectorateToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :natdirectorate, null: false, foreign_key: true, default: 1
  end
end
