class Student < User

  default_scope { :student }

  #associations
  belongs_to :school
  belongs_to :guardian
  has_one    :previous_detail, class_name: :StudentPreviousDetail
  has_one    :detail, class_name: :StudentDetail
  has_many   :attendances, class_name: :StudentAttendance
  has_many   :exam_results
  has_one    :image, as: :attachable, dependent: :destroy

  #validations
  validates :dob, presence: true
  
  def standard
    detail.standard
  end

  def homeworks
    standard.subjects.inject({}){|homeworks, subject| subject.homeworks }
  end

end
