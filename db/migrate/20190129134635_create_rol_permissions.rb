class CreateRolPermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :rol_permissions do |t|
      t.references :rol, foreign_key: true
      t.references :permission, foreign_key: true

      t.timestamps
    end
  end
end
