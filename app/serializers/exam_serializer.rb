class ExamSerializer < ActiveModel::Serializer
  attributes :id, :maximum_marks, :passing_marks,
              :subject_code, :subject_name, :date, :is_result_published

  def subject_name
    object.subject.name
  end

end
