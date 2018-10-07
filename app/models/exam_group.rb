class ExamGroup < ApplicationRecord

  #associations
  belongs_to  :standard
  has_many    :exams

  #validations
  validates :title, presence: true

  enum display_type: [ :marks, :marks_and_grades, :grades ]


end
