class Standard < ApplicationRecord

  #associations
  belongs_to :school
  has_many :sections

  #validations
  validates :title, presence: true
  
  #callbacks
  before_save :downcase_values

  # methods

  def student_count
    count = 0
    sections.each{ |section| count += section.student_count }
    return count
  end

  private

  def downcase_values
    self.title = title.downcase
  end

end
