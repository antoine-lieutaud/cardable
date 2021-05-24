class CreateRedeems < ActiveRecord::Migration[6.0]
  def change
    create_table :redeems do |t|
      t.references :voucher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
