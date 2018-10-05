class ExamResult < ApplicationRecord

  #associations
  belongs_to :exam
  belongs_to :student

  #validations

end
