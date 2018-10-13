class StaffAttendance < ApplicationRecord
  #TODO add today as default absent date before validation

  #associations
  belongs_to :teacher
  belongs_to :admin

  #validations
  validates :absent_on, presence: true

end
