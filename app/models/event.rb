class Event < ApplicationRecord

  #associations
  belongs_to :school
  belongs_to :admin
end
