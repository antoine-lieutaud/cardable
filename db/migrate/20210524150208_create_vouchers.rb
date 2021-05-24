class CreateVouchers < ActiveRecord::Migration[6.0]
  def change
    create_table :vouchers do |t|
      t.references :offer, null: false, foreign_key: true
      t.string :qr_code
      t.integer :limit_use
      t.string :limit_date

      t.timestamps
    end
  end
end
