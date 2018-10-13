class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_line_1, :address_line_2, :state, :city,
  :pincode, :landmark, :board, :landline_no_1, :landline_no_2, :fax, :website,
  :logo, :email_id, :image

  def address_line_1
    object.address.address_line_1
  end

  def address_line_2
    object.address.address_line_1
  end

  def landmark
    object.address.landmark
  end

  def city
    object.address.city
  end

  def state
    object.address.state
  end

  def pincode
    object.address.pincode
  end

  def logo
    object.logo_url
  end

  def image
    object.image_url
  end

end
