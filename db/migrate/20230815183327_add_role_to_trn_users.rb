class AddRoleToTrnUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :trn_users, :role, :integer, default: 0
  end
end
