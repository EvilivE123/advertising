class AdSpaceAgent < User
  self.table_name = 'users'

  default_scope { where(type: 'AdSpaceAgent') }

  has_many :pre_booked_slots
  has_many :booked_slots


end