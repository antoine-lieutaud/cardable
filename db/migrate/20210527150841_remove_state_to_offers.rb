class RemoveStateToOffers < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :state
  end
end
