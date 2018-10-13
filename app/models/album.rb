class Album < ApplicationRecord

#associations
belongs_to  :school
has_many    :pictures, -> { where(type: 2).try(:first) }, class_name: :Attachment, as: :attachable, dependent: :destroy
has_one     :image, -> { where(type: 0).try(:first) }, class_name: :Attachment, as: :attachable, dependent: :destroy

#validations
validates :name, presence: true

end
