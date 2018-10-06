class Guardian < User

  has_many   :wards, class_name: :User, foreign_key: :guardian_id

  #validations
  validates :occupation, presence: true

end
