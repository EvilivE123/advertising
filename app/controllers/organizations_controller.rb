class OrganizationsController < ApplicationController
  def index
  	@pre_booked_slots = PreBookedSlot.all 
  end

  def booked_slots
  	@booked_slots = Slot.booked.includes(:organization_ad_space_agent_slots)
  		.where(organization_ad_space_agent_slots: { organization_id: current_user })
  end
end
