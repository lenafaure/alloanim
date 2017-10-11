class AddSchoolToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :school, :string
  end
end
