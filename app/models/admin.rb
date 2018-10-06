class Admin < User

  has_secure_password

  #associations
  belongs_to :school

  #validations
  validates :username, presence: true

end
