class AddValidityToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :validity, :integer
  end
end
