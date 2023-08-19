class CreateTrnComments < ActiveRecord::Migration[7.0]
  def change
    create_table :trn_comments do |t|
      t.text :content
      t.references :trn_user, null: false, foreign_key: true
      t.references :trn_new, null: false, foreign_key: true

      t.timestamps
    end
  end
end
