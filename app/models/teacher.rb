class Teacher < User

  default_scope { where(role: :teacher) } 

  #associations
  belongs_to :school
  has_one    :image, class_name: :Attachment, as: :attachable, dependent: :destroy
  has_many   :student_attendances, class_name: :StudentAttendance
  has_many   :sections
  has_many   :subjects
  has_many   :attendances, class_name: :StaffAttendance

  #validations
  validates :qualification, presence: true
  validates :alternate_contact_no, presence: true
  validates :joining_date, presence: true
  validates :dob, presence: true

end
