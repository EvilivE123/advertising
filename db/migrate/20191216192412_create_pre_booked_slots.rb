class CreatePreBookedSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :pre_booked_slots do |t|
    	t.string :party_name
    	t.integer :price
    	t.integer :sold_amount
    	t.references :slot
    	t.references :ad_space_agent
    end
  end
end
