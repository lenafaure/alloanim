class RemoveDiplomaFromOffer < ActiveRecord::Migration[5.1]
  def change
    remove_column :offers, :diploma
  end
end
