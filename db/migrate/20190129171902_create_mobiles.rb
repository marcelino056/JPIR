class CreateMobiles < ActiveRecord::Migration[5.2]
  def change
    create_table :mobiles do |t|
      t.references :user, foreign_key: true
      t.string :model
      t.string :brand
      t.string :mac_address

      t.timestamps
    end
  end
end
