class School < ApplicationRecord

  #associations
  has_many :albums, dependent: :destroy
  has_many :students
  has_many :teachers
  has_many :principals
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

  def teachers_app_download_size
    teachers.where.not(last_login: nil).size
  end

  def principals_app_download_size
    principals.where.not(last_login: nil).size
  end

  def guardian_app_download_size
    school_students_guardians_id = students.map { |student| student.guardian.id }
    Guardian.where(id: school_students_guardians_id).where.not(last_login: nil).size
  end

  private

  def downcase_values
    #TODO code optimise
    self.name = name.downcase
    self.board = board.downcase
  end

end
