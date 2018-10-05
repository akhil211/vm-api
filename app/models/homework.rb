class Homework < ApplicationRecord
  #TODO add before validate default date today

  #associations
  belongs_to :subject
  has_one    :attachment, as: :attachable, dependent: :destroy

  #validations
  validates :description, presence: true
  validates :date, presence: true

end
