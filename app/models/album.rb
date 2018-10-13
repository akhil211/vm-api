class Album < ApplicationRecord

  #associations
  belongs_to  :school
  has_many    :attachments, as: :attachable, dependent: :destroy

  #validations
  validates :name, presence: true

  #methods

  def image
    attachments.image.try(:first)
  end

  def image_url
    image.present? ? image.url : 'album default url'
  end

  def pictures
    attachments.pictures
  end

end
