class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :adress, null: false
      t.string :buliding_name
      t.string :phone_number, null: false
      t.references :card, null: false, foreign_key: true
    end
  end
end