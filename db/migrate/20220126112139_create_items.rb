class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.integer :category_id, null: false
      t.integer :situation_id, null: false
      t.integer :postage_id, null: false
      t.integer :city_id, null: false
      t.integer :shipping_date_id, null: false
      t.text :explanation, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end