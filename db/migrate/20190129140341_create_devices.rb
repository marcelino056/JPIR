class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.inet :ip_address
      t.string :mac_address
      t.string :user
      t.string :password

      t.timestamps
    end
  end
end
