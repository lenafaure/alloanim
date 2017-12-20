class DropRhcellulesTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :rhcellules
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
