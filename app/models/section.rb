class Section < ApplicationRecord

	# associations
	belongs_to :standard
	belongs_to :teacher
	has_many :student_details
	has_many :students, through: :student_details
	has_many :subjects
	has_many   :exam_groups

	# validations
	validates :name, presence: true


	def display
		[standard.title, display].join('')
	end

	def title
		name.present? ? "(#{name.titleize})" : nil
	end

	def student_count
		student_details.size
	end

end
