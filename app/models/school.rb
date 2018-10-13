class School < ApplicationRecord

  #associations
  has_many :albums, dependent: :destroy
  has_many :users
  has_many :events
  has_many :news, class_name: :BulletinBoard, dependent: :destroy
  has_many :standards, dependent: :destroy
  has_many  :attachments, as: :attachable, dependent: :destroy
  has_one  :address, as: :addressable, dependent: :destroy

  #validations
  validates :name, presence: true
  validates :landline_no_1, presence: true
  validates :board, presence: true

  #enum
  enum status: { active: 1, inactive: 0 }

  #callbacks
  before_save :downcase_values

  def logo_url
    logo.present? ? logo.url : 'default logo url'
  end

  def image_url
    image.present? ? image.url : 'default image url'
  end

  def logo
    attachments.logo.try(:first)
  end

  def image
    attachments.image.try(:first)
  end

  private

  def downcase_values
    #TODO code optimise
    self.name = name.downcase
    self.board = board.downcase
  end

end
