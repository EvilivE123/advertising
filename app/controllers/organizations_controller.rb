class OrganizationsController < ApplicationController
  def index
  	@pre_booked_slots = PreBookedSlot.all 
  end

  def booked_slots
  	@booked_slots = Slot.booked.includes(:booked_slots)
  		.where(booked_slots: { organization: current_user })
  end

  def requested_slots
  	@requested_slots = BookedSlot.where(organization_id: current_user.id)
  end
end
