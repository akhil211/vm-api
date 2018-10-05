class Attachment < ApplicationRecord

  belongs_to :attachable, polymorphic: true

  has_attached_file :data, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
  validates :data, attachment_presence: true
  validates_attachment_content_type :data, content_type: /\Aimage\/.*\z/

end
