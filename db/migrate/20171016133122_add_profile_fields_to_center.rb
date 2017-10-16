class AddProfileFieldsToCenter < ActiveRecord::Migration[5.1]
  def change
    add_column :centers, :first_name, :string
    add_column :centers, :last_name, :string
    add_column :centers, :circonscription, :string
  end
end
