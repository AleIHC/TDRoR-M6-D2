class CreateTrnNews < ActiveRecord::Migration[7.0]
  def change
    create_table :trn_news do |t|
      t.string :image
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
