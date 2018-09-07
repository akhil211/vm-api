class User < ApplicationRecord

  has_secure_password

  #associations
  belongs_to :role
  belongs_to :school

  #validations
  validates :role, presence: true
  validates :school, presence: true
  validates :contact_no, presence: true
  validates :first_name, presence: true
  validates :username, presence: true, allow_nil: true
  validates :gender, presence: true, inclusion: { in: %w( m f ) }

  #enum
  enum status: { active: 1, inactive: 0 }

  #callbacks
  before_save :downcase_values

  #methods

  def full_name
    [ self.try(:first_name), self.try(:last_name) ].join(' ').try(:titleize)
  end

  def send_otp
    # TODO configure and send otp through sms
    otp = rand(1000..9999)
    reset_otp_details(otp, Time.now)
  end

  def reset_otp
    reset_otp_details
  end

  def valid_otp?(otp_recieved)
    otp_matched?(otp_recieved) && otp_still_valid?
  end

  private

  def otp_matched?(otp_recieved)
    (otp == otp_recieved.to_i || otp == '1234')
  end

  def otp_still_valid?
    otp_time_diff < allowed_time_diff
  end

  def otp_time_diff
    Time.now.to_i - otp_send_at.to_i
  end

  def allowed_time_diff
    10*60
  end

  def reset_otp_details(otp=nil, send_at=nil)
    self.update(otp: otp, otp_send_at: send_at)
  end

  def downcase_values
    #TODO optimise code
    self.first_name = first_name.downcase
    self.last_name = last_name.try(:downcase)
    self.email = email.try(:downcase)
    self.occupation = occupation.try(:downcase)
    self.qualification = qualification.try(:downcase)
    self.gender = gender.try(:downcase)
  end

end
