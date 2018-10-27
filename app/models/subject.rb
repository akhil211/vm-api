class Subject < ApplicationRecord

  #associations
  belongs_to :section
  belongs_to :teacher
  has_many   :homeworks
  has_many   :exams

  #associations
  validates :title, presence: true

  #callbacks
  before_save :downcase_values

  def name
    title.titleize
  end

  def homework_alloted?
    todays_homework.present? ? 'yes' : 'no'
  end

  def todays_homework
    homeworks.find_by(date: Date.today)
  end

  private

  def downcase_values
    self.title = title.downcase
  end

end
