class AddDefaultToNbRedeemsOfVoucher < ActiveRecord::Migration[6.0]
  def change
    change_column :vouchers, :nb_redeems, :integer, default: 0
  end
end
