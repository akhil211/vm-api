class Student::HomeworkDatesSerializer < ActiveModel::Serializer
  attributes :homework_date

  def homework_date
    object.date
  end
end
