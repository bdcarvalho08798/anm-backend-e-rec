class CreateDirectorates < ActiveRecord::Migration[7.1]
  def change
    create_table :directorates do |t|
      t.string :dircode
      t.string :dirname

      t.timestamps
    end
  end
end
