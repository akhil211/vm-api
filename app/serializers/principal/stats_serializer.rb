class Principal::StatsSerializer < ActiveModel::Serializer
  attributes :teachers, :parents, :principals, :directors, :total

  def teachers
  	object.school.teachers_app_download_size
  end

  def parents
  	object.school.guardian_app_download_size
  end

  def principals
  	object.school.principals_app_download_size
  end

  def directors
  	0
  end

  def total
  	teachers + parents + principals + directors
  end

end