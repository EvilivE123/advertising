class Organization < User
  self.table_name = 'users'

  default_scope { where(type: 'Organization') }
  
  has_many :booked_slots

end
