class StudentAttendance < ApplicationRecord
  #TODO add today as default absent date before validation

  #associations
  belongs_to :student
  belongs_to :teacher

  #validations
  validates :absent_on, presence: true

end
