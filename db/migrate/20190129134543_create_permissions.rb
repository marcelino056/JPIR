class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :object
      t.string :method
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
