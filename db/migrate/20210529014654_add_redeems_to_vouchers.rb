class AddRedeemsToVouchers < ActiveRecord::Migration[6.0]
  def change
    add_column :vouchers, :nb_redeems, :integer
  end
end
