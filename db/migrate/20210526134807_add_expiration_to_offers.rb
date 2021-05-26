class AddExpirationToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :expiration, :date
  end
end
