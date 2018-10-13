class School < ApplicationRecord

  #associations
  has_many :albums, dependent: :destroy
  has_many :users
  has_many :events
  has_many :news, class_name: :BulletinBoard, dependent: :destroy
  has_many :standards, dependent: :destroy
  has_one  :logo, -> { where(file_type: 1).try(:first) }, class_name: :Attachment, as: :attachable, dependent: :destroy
  has_one  :image, -> { where(file_type: 0).try(:first) }, class_name: :Attachment, as: :attachable, dependent: :destroy
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
    logo ? logo.url : 'default logo url'
  end

  private

  def downcase_values
    #TODO code optimise
    self.name = name.downcase
    self.board = board.downcase
  end

end
