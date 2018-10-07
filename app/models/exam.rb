class Exam < ApplicationRecord

  #associations
  belongs_to :exam_group
  belongs_to :subject
  has_many  :exam_results

  #validations
  validates :maximum_marks, presence: true
  validates :passing_marks, presence: true
  validates :subject_code, presence: true, uniqueness: {scope: :exam_group_id}


end
