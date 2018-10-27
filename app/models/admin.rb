class Admin < User

  has_secure_password

  default_scope { where(role: :admin) }

  #associations
  belongs_to :school

  #validations
  validates :username, presence: true

end
