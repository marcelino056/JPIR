class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
