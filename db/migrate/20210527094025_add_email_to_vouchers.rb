class AddEmailToVouchers < ActiveRecord::Migration[6.0]
  def change
    add_column :vouchers, :customer_email, :string
  end
end
