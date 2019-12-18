class PreBookedSlot < ApplicationRecord

  belongs_to :slot
  belongs_to :ad_space_agent

  validates_presence_of :party_name, :price, :slot_id, :ad_space_agent_id
  validates_uniqueness_of :slot_id

end