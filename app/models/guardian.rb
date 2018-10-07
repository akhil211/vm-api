class Guardian < User

  attr_accessor :school

  default_scope { :guardian }

  has_many   :wards, class_name: :Student, foreign_key: :guardian_id

  #validations
  validates :occupation, presence: true

  def school
    wards.first.school
  end

end
