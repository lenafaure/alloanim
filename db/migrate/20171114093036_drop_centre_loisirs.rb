class DropCentreLoisirs < ActiveRecord::Migration[5.1]
  def change
    drop_table :centre_loisirs
  end
end
