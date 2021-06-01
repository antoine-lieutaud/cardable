class AddExpirationDateToVouchers < ActiveRecord::Migration[6.0]
  def change
    add_column :vouchers, :expiration_date, :date
  end
end
