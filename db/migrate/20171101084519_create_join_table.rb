class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :diplomas, :offers do |t|
      # t.index [:diploma_id, :offer_id]
      # t.index [:offer_id, :diploma_id]
    end
  end
end
