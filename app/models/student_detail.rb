class StudentDetail < ApplicationRecord

  #associations
  belongs_to :student
  belongs_to :section

  #validations
  validates :roll_no, presence: true, uniqueness: {scope: [:section_id]}
  validates :admission_no, presence: true
  validates :admission_date, presence: true

  #callbacks
  before_save :downcase_values

  private

  def downcase_values
    #TODO optimise code
    self.category = category.try(:downcase)
  end

end
