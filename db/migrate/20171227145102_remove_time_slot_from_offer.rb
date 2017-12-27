class RemoveTimeSlotFromOffer < ActiveRecord::Migration[5.1]
  def change
    remove_column :offers, :time_slot
  end
end
