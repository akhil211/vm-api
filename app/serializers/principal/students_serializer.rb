class Principal::StudentsSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :roll_no, :admission_no, :std, :section, :contact_no,
  :app_downloaded, :photo

  def admission_number
  	object.admission_no
  end

  def std
  	object.standard.title
  end

  def section
  	object.section.name.titleize
  end

  def photo
  	''
  end

  def app_downloaded
  	object.guardian.last_login.present? ? 'Yes' : 'No'
  end

 end