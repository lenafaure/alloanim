class AddCenterToOffers < ActiveRecord::Migration[5.1]
  def change
    add_reference :offers, :center, foreign_key: true
  end
end
