class AddStatusToZones < ActiveRecord::Migration[5.2]
  def change
    add_column :zones, :status, :string
  end
end
