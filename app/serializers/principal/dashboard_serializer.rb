class Principal::DashboardSerializer < ActiveModel::Serializer
  attributes :students_count, :teachers_count, :alerts_count, :absent_count, :sms_sent_today,
  			:sms_balance, :school_name, :app_downloads

  def students_count
  	object.school.students.size
  end

  def teachers_count
  	object.school.teachers.size
  end

  def alerts_count
  	object.alerts.unread.size
  end

  def school_name
  	object.school.name.titleize
  end

  def absent_count
  	0
  end

  def sms_sent_today
  	0
  end

  def sms_balance
  	0
  end

  def app_downloads
  	school = object.school
  	teachers_app_downloads = school.teachers.where.not(last_login: nil).size
  	school_students_guardians_id = school.students.map { |student| student.guardian.id }
  	gaurdian_size = Guardian.where(id: school_students_guardians_id).where.not(last_login: nil).size
  	return teachers_app_downloads + gaurdian_size
  end

end
