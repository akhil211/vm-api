class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :dob, :contact_no, :permanent_address, 
  			:correspondence_address, :joining_date, :qualification, :created_at

end
