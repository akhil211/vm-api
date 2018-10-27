class Master < User

  has_secure_password

  default_scope { where(role: :master) }

  validates :username, presence: true

end
