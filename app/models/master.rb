class Master < User

  has_secure_password

  validates :username, presence: true

end
