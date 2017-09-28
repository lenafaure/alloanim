class CreateAvailabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :availabilities do |t|
      t.references :user, foreign_key: true
      t.string :date
      t.string :time_slot

      t.timestamps
    end
  end
end
