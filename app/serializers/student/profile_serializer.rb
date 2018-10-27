class Student::ProfileSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :section, :roll_no, :gender, :dob, :category,
  :contact_no, :image_url, :standard_id, :standard, :admission_details

  attribute :previous_education_details

  def section
    object.section.name.titleize
  end

  def standard_id
    object.standard.id
  end

  def standard
    object.standard.title
  end

  def admission_details
    {admission_date: object.admission_date, admission_number: object.admission_no}
  end

  def previous_education_details
    object.previous_detail
  end

end
