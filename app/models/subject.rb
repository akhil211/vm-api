class Subject < ApplicationRecord

  #associations
  belongs_to :standard
  belongs_to :teacher, foreign_key: :teacher_id, class_name: :User

  #associations
  validates :title, presence: true

  #callbacks
  before_save :downcase_values

  private

  def downcase_values
    self.title = title.downcase
  end

end
