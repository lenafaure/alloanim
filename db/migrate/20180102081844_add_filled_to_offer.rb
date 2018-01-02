class AddFilledToOffer < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :filled, :boolean, :default => false
  end
end
