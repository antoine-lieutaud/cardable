class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
