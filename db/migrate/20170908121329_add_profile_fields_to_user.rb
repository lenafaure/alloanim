class AddProfileFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :soi_number, :string
    add_column :users, :circonscription, :integer
    add_column :users, :school, :string
  end
end
