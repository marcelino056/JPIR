class AddStatusToDevisePositions < ActiveRecord::Migration[5.2]
  def change
    add_column :devise_positions, :status, :string
  end
end
