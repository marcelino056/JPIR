class CreateMobileIps < ActiveRecord::Migration[5.2]
  def change
    create_table :mobile_ips do |t|
      t.references :mobile, foreign_key: true
      t.inet :ip_address

      t.timestamps
    end
  end
end
