class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
    	t.datetime 'from'
    	t.datetime 'to'
    	t.string :aasm_state
      t.timestamps
    end
  end
end
