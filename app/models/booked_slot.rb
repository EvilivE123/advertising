class BookedSlot < ApplicationRecord

	belongs_to :organization
	belongs_to :ad_space_agent
	belongs_to :slot

	validate :validate_bid_value, on: :create

	validate :validate_duplicate_request_for_bid

	validate :validate_duplicate_bid

	class << self

		def book_requested_high_bid_slots
			self.all.order('bid DESC').group_by(&:slot_id).values.each do |booked_slots|
				booked_slot = booked_slots.first
				UserMailer.send_booked_slot_mail_to_orgainzation(booked_slot.organization, booked_slot).deliver_now
				UserMailer.send_booked_slot_mail_to_agent(booked_slot.ad_space_agent, booked_slot).deliver_now
				booked_slot.slot.booked!
			end
		end

	end

	private

	def validate_duplicate_request_for_bid
		if BookedSlot.select{|b| (b.organization_id == self.organization_id) && (b.slot_id == self.slot_id) }.present?
			errors.add(:bid, 'Bid is already added')
		end
	end

	def validate_duplicate_bid
		if BookedSlot.select{|b| (b.slot_id == self.slot_id) && (b.bid == self.bid) }.present?
			errors.add(:bid, 'Change the value of bid')
		end
	end

	def validate_bid_value
		if bid < slot.pre_booked_slot.price
			errors.add(:bid, "Cannot be less than #{slot.pre_booked_slot.price}")
		end
	end

end
