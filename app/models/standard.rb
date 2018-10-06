class Standard < ApplicationRecord

  #associations
  belongs_to :school
  belongs_to :teacher, foreign_key: :teacher_id, class_name: :User

  #validations
  validates :title, presence: true
  validates :section, presence: true

  #callbacks
  before_save :downcase_values

  private

  def downcase_values
    self.title = title.downcase
    self.section = section.downcase
  end

end
