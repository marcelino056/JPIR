class AddStatusToDevices < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :status, :string
  end
end
