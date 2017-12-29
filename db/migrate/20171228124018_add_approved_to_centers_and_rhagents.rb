class AddApprovedToCentersAndRhagents < ActiveRecord::Migration[5.1]
  def self.up
    add_column :centers, :approved, :boolean, :default => false, :null => false
    add_index  :centers, :approved
    add_column :rhagents, :approved, :boolean, :default => false, :null => false
    add_index  :rhagents, :approved
  end

  def self.down
    remove_index  :centers, :approved
    remove_column :centers, :approved
    remove_index  :rhagents, :approved
    remove_column :rhagents, :approved
  end
end
