class CreateMobileLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :mobile_locations do |t|
      t.references :mobile, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
