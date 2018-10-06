class StudentDetail < ApplicationRecord

  #associations
  belongs_to :student
  belongs_to :standard

  #validations
  validates :role_no, presence: true, uniqueness: {scope: [:standard_id]}
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
