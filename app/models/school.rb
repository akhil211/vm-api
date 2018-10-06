class School < ApplicationRecord

  #associations
  has_many :albums, dependent: :destroy
  has_many :users
  has_many :standards, dependent: :destroy
  has_one  :image, as: :attachable, dependent: :destroy

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

  private

  def downcase_values
    #TODO code optimise
    self.name = name.downcase
    self.city = city.downcase
    self.state = state.downcase
    self.board = board.downcase
  end

end
