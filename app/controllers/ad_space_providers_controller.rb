class AdSpaceProvidersController < ApplicationController
  def index
  	@slots = Slot.all
  end
end
