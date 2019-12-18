class CreateBookedSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :booked_slots do |t|
    	t.integer :bid
    	t.references :organization
    	t.references :ad_space_agent
    	t.references :slot
      t.timestamps
    end
  end
end
