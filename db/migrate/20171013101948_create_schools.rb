class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :circonscription
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
