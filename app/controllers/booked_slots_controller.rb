class BookedSlotsController < ApplicationController
  before_action :find_slot_organization_ad_space_agent, only: [:new, :create]

  def new
  	@booked_slot = BookedSlot.new
    @booked_slot.slot = @slot
    @booked_slot.organization = @organization
    @booked_slot.ad_space_agent = @ad_space_agent
  end

  def create
    @booked_slot = BookedSlot.new(booked_slot_params)
    @booked_slot.slot = @slot
    @booked_slot.organization = @organization
    @booked_slot.ad_space_agent = @ad_space_agent
  	if @booked_slot.save
  		flash[:success] = 'Request Made to book slot successfully'
      redirect_to organizations_path
    else
  		render :new
    end
  end

	def find_slot_organization_ad_space_agent
    @slot = Slot.find_by_id(params[:slot_id])
    @ad_space_agent = AdSpaceAgent.find_by_id(params[:ad_space_agent_id])
    @organization = Organization.find_by_id(params[:organization_id]) 	
	end  

  private

  def booked_slot_params
  	params.require(:booked_slot).permit(
  		:organization_id,
  		:ad_space_agent_id,
  		:slot_id,
  		:bid
  	)
  end

end
