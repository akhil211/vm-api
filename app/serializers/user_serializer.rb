class UserSerializer < ActiveModel::Serializer
  attributes :id, :contact_no, :email, :first_name, :last_name, :home_address,
  :office_address, :alternate_contact_no, :occupation, :qualification, :gender,
  :spouse_full_name, :status, :username, :created_at, :school_id, :school_name,
  :full_name

  def school_name
    object.school.name.try(:titleize)
  end

end
