class AddNameToTrnUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :trn_users, :name, :string
  end
end
