class Teacher < User

  default_scope { :teacher }

  #associations
  belongs_to :school
  has_one    :image, class_name: :Attachment, as: :attachable, dependent: :destroy
  has_many   :student_attendances, class_name: :StudentAttendance, foreign_key: :teacher_id
  has_many   :standards, class_name: :Standard, foreign_key: :teacher_id
  has_many   :subjects, class_name: :Standard, foreign_key: :teacher_id
  has_many   :attendances, class_name: :StaffAttendance

  #validations
  validates :qualification, presence: true
  validates :alternate_contact_no, presence: true
  validates :home_address, presence: true
  validates :joining_date, presence: true
  validates :dob, presence: true


end
