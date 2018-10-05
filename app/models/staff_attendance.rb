class StaffAttendance < ApplicationRecord
  #TODO add today as default absent date before validation

  #associations
  belongs_to :user
  belongs_to :admin, foreign_key: :admin_id, class_name: :User

  #validations
  validates :absent_on, presence: true

end
