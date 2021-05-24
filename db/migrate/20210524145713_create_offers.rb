class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.integer :price
      t.string :description
      t.references :restaurant, null: false, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end
