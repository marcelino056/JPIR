class CreateDevisePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :devise_positions do |t|
      t.references :device, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
