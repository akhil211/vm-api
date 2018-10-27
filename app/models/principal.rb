class Principal < User

  #associations
  belongs_to :school

  default_scope { where(role: :principal) }

  #validations
  validates :qualification, presence: true
  validates :alternate_contact_no, presence: true
  validates :joining_date, presence: true
  validates :dob, presence: true

end
