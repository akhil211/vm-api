class Student < User

  default_scope { where(role: :student) }

  #associations
  belongs_to :school
  belongs_to :guardian
  has_one    :previous_detail, class_name: :StudentPreviousDetail
  has_one    :detail, class_name: :StudentDetail
  has_many   :attendances, class_name: :StudentAttendance
  has_many   :exam_results
  has_one    :image, class_name: :Attachment, as: :attachable, dependent: :destroy

  #validations
  validates :dob, presence: true

  def standard
    detail.section.standard
  end

  def section
    detail.section
  end

  def homeworks
    section.subjects.inject({}){|homeworks, subject| subject.homeworks }
  end

  def roll_no
    detail.roll_no
  end

  def admission_no
    detail.admission_no
  end

  def admission_date
    detail.admission_date
  end

  def category
    detail.category
  end

  def image_url
    image.present? ? image.url : 'default student image'
  end

end
