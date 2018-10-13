class Standard < ApplicationRecord

  #associations
  belongs_to :school
  belongs_to :teacher
  has_many   :subjects
  has_many   :exam_groups

  #validations
  validates :title, presence: true
  validates :section, presence: true

  #callbacks
  before_save :downcase_values

  def name
    [title, section_display].join('')
  end

  def section_display
    section.present? ? "(#{section.titleize})" : nil
  end

  def section_name
    section.titleize
  end

  private

  def downcase_values
    self.title = title.downcase
    self.section = section.downcase
  end

end
