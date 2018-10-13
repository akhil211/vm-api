class Attachment < ApplicationRecord

  belongs_to :attachable, polymorphic: true

  has_attached_file :file, styles: { medium: "300x300>" }
  validates :file, attachment_presence: true
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/

end
