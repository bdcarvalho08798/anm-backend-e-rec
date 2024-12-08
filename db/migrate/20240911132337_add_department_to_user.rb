class AddDepartmentToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :department, null: false, foreign_key: true, default: 1
  end
end
