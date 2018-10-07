class Master < User

  has_secure_password

  default_scope { :master }

  validates :username, presence: true

end
