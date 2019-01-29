class AddStatusToMobiles < ActiveRecord::Migration[5.2]
  def change
    add_column :mobiles, :status, :string
  end
end
