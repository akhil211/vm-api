class TeacherSerializer < ActiveModel::Serializer
 	attributes :id, :first_name, :last_name, :dob, :contact_no, :permanent_address, 
  			:correspondence_address, :joining_date, :qualification, :created_at, :school_id,
  			:photo_file_name, :photo_content_type, :updated_at

  	def permanent_address
  		object.permament_address_full
  	end

  	def correspondence_address
  		object.correspondence_address_full
  	end

  	def photo_file_name
  		object.image.try(:file_file_name)
  	end

  	def photo_content_type
  		object.image..try(:file_content_type)
  	end

  	def school_id
  		object.school.id
  	end

end
