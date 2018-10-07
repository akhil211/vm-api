class Student::HomeworkDetailsSerializer < ActiveModel::Serializer
  attributes :description, :subject

  def subject
    object.subject.name
  end

end
