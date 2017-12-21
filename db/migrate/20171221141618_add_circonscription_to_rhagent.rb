class AddCirconscriptionToRhagent < ActiveRecord::Migration[5.1]
  def change
    add_column :rhagents, :first_name, :string
    add_column :rhagents, :last_name, :string
    add_column :rhagents, :circonscription, :string
  end
end
