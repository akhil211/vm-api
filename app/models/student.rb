class Student < User

  #associations
  belongs_to :school
  belongs_to :guardian, class_name: :User, foreign_key: :guardian_id
  has_one    :previous_detail, class_name: :StudentPreviousDetail, foreign_key: :student_id
  has_one    :detail, class_name: :StudentDetail, foreign_key: :student_id
  has_many   :attendances, class_name: :StudentAttendance, foreign_key: :student_id
  has_many   :exam_results, class_name: :ExamResult, foreign_key: :student_id
  has_one    :image, as: :attachable, dependent: :destroy

  #validations
  validates :dob, presence: true
  validates :home_address, presence: true

end
