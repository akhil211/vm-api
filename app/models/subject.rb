class Subject < ApplicationRecord

  #associations
  belongs_to :standard
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


  private

  def downcase_values
    self.title = title.downcase
  end

end
