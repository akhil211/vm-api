class BulletinBoard < ApplicationRecord
  #associations
  belongs_to  :school
  belongs_to  :admin
  has_one     :attachment, as: :attachable, dependent: :destroy


end
