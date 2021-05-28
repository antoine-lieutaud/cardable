class AddPriceToVouchers < ActiveRecord::Migration[6.0]
  def change
    add_column :vouchers, :final_price, :integer
  end
end
