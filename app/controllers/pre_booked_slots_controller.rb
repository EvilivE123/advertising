class PreBookedSlotsController < ApplicationController
  before_action :build_pre_booked_slot, only: [:create]

	def new
		@pre_booked_slot = PreBookedSlot.new
		@slot = Slot.find_by_id(params[:slot_id])
	end

	def create
    if @pre_booked_slot.save
  		flash[:notice] = 'Slot Pre-Booked Successfully.'
  		redirect_to ad_space_agents_path
  		@pre_booked_slot.slot.pre_booked!
  	else
  		render :new
  	end		
	end

  def build_pre_booked_slot
    slot = Slot.find_by_id(params[:slot_id])
    ad_space_agent = AdSpaceAgent.find_by_id(params[:ad_space_agent_id])
  	@pre_booked_slot = PreBookedSlot.new(pre_booked_slot_params)
  	@pre_booked_slot.slot = slot
  	@pre_booked_slot.ad_space_agent = ad_space_agent
  end

	def pre_booked_slot_params
		params.require(:pre_booked_slot).permit(
			:party_name,
			:amount,
			:ad_space_agent_id,
			:slot_id,
			:price
		)
	end

end