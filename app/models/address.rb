class Address < ApplicationRecord

  #associations
  belongs_to :addressable, polymorphic: true

  #validations
  validates :city, presence: true
  validates :state, presence: true
  validates :address_line_1, presence: true
  validates :address_line_2, presence: true
  validates :pincode, presence: true

  #enums
  enum address_type: [:permanent, :correspondence]


end
