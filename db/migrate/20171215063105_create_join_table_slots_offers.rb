class CreateJoinTableSlotsOffers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :slots, :offers do |t|
      # t.index [:slot_id, :offer_id]
      # t.index [:offer_id, :slot_id]
    end
  end
end
