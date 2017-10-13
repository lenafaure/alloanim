class AddCenterToSchools < ActiveRecord::Migration[5.1]
  def change
    add_reference :schools, :center, foreign_key: true
  end
end
