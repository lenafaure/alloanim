class AddDiplomaToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :diploma, :string
  end
end
