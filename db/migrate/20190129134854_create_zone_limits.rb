class CreateZoneLimits < ActiveRecord::Migration[5.2]
  def change
    create_table :zone_limits do |t|
      t.references :zone, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
