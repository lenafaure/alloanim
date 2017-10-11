class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :date
      t.string :time_slot
      t.string :diploma
      t.integer :offer_number

      t.timestamps
    end
  end
end
