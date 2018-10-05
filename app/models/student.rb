class Student < ApplicationRecord

  #associations
  belongs_to :school
  belongs_to :guardian, class_name: :User, foreign_key: :guardian_id
  belongs_to :standard
  has_one    :student_previous_details
  has_one    :image, as: :attachable, dependent: :destroy

  #validations
  validates :role_no, presence: true, uniqueness: {scope: [:standard_id]}
  validates :admission_no, presence: true, uniqueness: {scope: [:school_id]}
  validates :dob, presence: true
  validates :first_name, presence: true

  #callbacks
  before_save :downcase_values

  private

  def downcase_values
    self.first_name = first_name.downcase
    self.last_name = last_name.try(:downcase)
    self.category = category.try(:downcase)
  end

end
