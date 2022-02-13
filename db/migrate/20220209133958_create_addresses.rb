class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code, null: false
      t.integer :city_id, null: false
      t.string :municipality, null: false
      t.string :block, null: false
      t.string :building
      t.string :number, null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
