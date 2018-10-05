class Album < ApplicationRecord

#associations
belongs_to  :school
has_many    :files, as: :attachable, dependent: :destroy
has_one     :image, as: :attachable, dependent: :destroy

#validations
validates :name, presence: true

end
