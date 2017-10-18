class AddSchoolReferenceToOffers < ActiveRecord::Migration[5.1]
  def change
    add_reference :offers, :school, foreign_key: true
    remove_column :offers, :school
  end
end
