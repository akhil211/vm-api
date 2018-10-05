class StudentAttendance < ApplicationRecord
  #TODO add today as default absent date before validation 

  #associations
  belongs_to :student
  belongs_to :teacher, foreign_key: :teacher_id, class_name: :User

  #validations
  validates :absent_on, presence: true

end
