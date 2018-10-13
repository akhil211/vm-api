class School < ApplicationRecord

  #associations
  has_many :albums, dependent: :destroy
  has_many :users
  has_many :standards, dependent: :destroy
  has_one  :logo, -> { where(type: 1).try(:first) }, class_name: :Attachment, as: :attachable, dependent: :destroy
  has_one  :image, -> { where(type: 0).try(:first) }, class_name: :Attachment, as: :attachable, dependent: :destroy
  has_one  :address, as: :attachable, dependent: :destroy

  #validations
  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :contact_no, presence: true
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
    self.city = city.downcase
    self.state = state.downcase
    self.board = board.downcase
  end

end
