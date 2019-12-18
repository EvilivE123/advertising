class SlotsController < ApplicationController
  before_action :convert_string_params_to_datetime, only: :create

  def new
    @slot = Slot.new    
  end

  def create
    @slot = Slot.new(slot_params)
    if @slot.save
  		flash[:notice] = 'Slot Created Successfully.'
  		redirect_to ad_space_providers_path
  	else
  		render :new
  	end
  end

  def convert_string_params_to_datetime

  end

  private

  def slot_params
  	params.require(:slot).permit(
  		:from, 
  		:to,
  		:aasm_state
  	)
  end

end
