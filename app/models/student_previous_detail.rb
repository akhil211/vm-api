class StudentPreviousDetail < ApplicationRecord

  #associations
  belongs_to :student

  #validations
  validates :school, presence: true
  validates :board, presence: true
  validates :standard, presence: true
  validates :year, presence: true

end
