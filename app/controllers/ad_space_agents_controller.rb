class AdSpaceAgentsController < ApplicationController
  def index
  	@slots = Slot.created
  end

  def pre_booked_slots
  	@pre_booked_slots = Slot.pre_booked.joins(:pre_booked_slot)
  		.where(pre_booked_slot: { ad_space_agent_id: current_user.id } )
  end
end
