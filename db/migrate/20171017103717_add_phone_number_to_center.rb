class AddPhoneNumberToCenter < ActiveRecord::Migration[5.1]
  def change
    add_column :centers, :phone_number, :string
  end
end
