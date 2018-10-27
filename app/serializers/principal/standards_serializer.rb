class Principal::StandardsSerializer < ActiveModel::Serializer
  attributes :id, :name, :student_count

  def name
  	object.title
  end

 end