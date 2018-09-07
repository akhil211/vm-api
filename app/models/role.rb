class Role < ApplicationRecord

#associations
has_many :users

#validations
validates :name, presence: true, uniqueness: true

#callbacks
before_save :downcase_values

private

def downcase_values
  self.name = name.downcase
end

end
