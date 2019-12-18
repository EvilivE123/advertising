class BookedSlot < ApplicationRecord

	belongs_to :organization
	belongs_to :ad_space_agent
	belongs_to :slot

	before_create :validate_bid_value, on: :create

	private

	def validate_bid_value
		if bid < slot.pre_booked_slot.price
			errors.add(:bid, "Cannot be less than #{slot.pre_booked_slot.price}")
		end
	end

end
