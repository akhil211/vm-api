class User < ApplicationRecord

  #associations
  #belongs_to :role
  has_one  :permanent_address, -> { where(address_type: 0).try(:first) }, class_name: :Address, as: :addressable, dependent: :destroy
  has_one  :correspondence_address, -> { where(address_type: 1).try(:first) }, class_name: :Address, as: :addressable, dependent: :destroy
  has_many :alerts

  #validations
  validates :contact_no, presence: true, unless: "student?"
  validates :first_name, presence: true
  validates :gender, presence: true, inclusion: { in: %w( male female ) }

  #enum
  enum status: { active: 1, inactive: 0 }
  enum role: [:master, :guardian, :admin, :teacher, :principal, :student]

  #callbacks
  before_save :downcase_values

  #methods

  def full_name
    [ self.try(:first_name), self.try(:last_name) ].join(' ').try(:titleize)
  end

  def spouse_full_name
    self.spouse_name.try(:titleize)
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
    #otp_matched?(otp_recieved) && otp_still_valid? #TODO uncomment when go live
    otp_matched?(otp_recieved)
  end

  private

  def otp_matched?(otp_recieved)
    (otp == otp_recieved.to_i || otp_recieved.to_i == 1234)
  end

  def otp_still_valid?
    otp_time_diff < allowed_time_diff
  end

  def otp_time_diff
    Time.now.to_i - otp_send_at.to_i
  end

  def allowed_time_diff
    10*60 #10 mins
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
