class CreateDiplomas < ActiveRecord::Migration[5.1]
  def change
    create_table :diplomas do |t|
      t.string :name

      t.timestamps
    end
  end
end
