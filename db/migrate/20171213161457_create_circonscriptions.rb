class CreateCirconscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :circonscriptions do |t|
      t.string :name

      t.timestamps
    end
  end
end
