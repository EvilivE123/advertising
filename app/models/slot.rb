class Slot < ApplicationRecord
	include AASM

	has_one :pre_booked_slot
  has_one :booked_slot

  validates_presence_of :from, :to
  
  validates_datetime :from, on_or_before: :to
  validates_datetime :to, on_or_after: :from
  validate :ambiguous_time, on: :create

  scope :within_from_and_to_dates, -> (from, to) { 
    where('(slots.from BETWEEN ? AND ?) OR (slots.to BETWEEN ? AND ?)', from, to, from, to) 
  }

  aasm do
    state :created, initial: true
    state :pre_booked, :booked

    event :pre_booked do
      transitions from: :created, to: :pre_booked
    end

    event :booked do
			transitions from: :pre_booked, to: :booked 
    end
  end
  
  def dates
    from.to_date.to_s + ' - ' + to.to_date.to_s
  end

  def time_in_format(from_or_to)
    from_or_to.strftime('%I:%M %p')
  end

  private

  def ambiguous_time
    if Slot.within_from_and_to_dates(from, to).present?
      errors.add(:from, 'slot already created')
      errors.add(:to, 'slot already created')
    end
  end

end
