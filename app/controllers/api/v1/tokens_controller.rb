class Api::V1::TokensController < Api::V1::BaseController

  skip_before_action :authenticate
  before_action :find_by_contact, only: [:request_otp, :mobile_authentication]

  def create
    @user = User.find_by(username: auth_params[:username])
    if @user.present? && @user.authenticate(auth_params[:password])
      render json: login_success
    else
      render json: invalid_login_details
    end
  end

  def request_otp
    @user.send_otp
    render json: otp_success
  end

  def mobile_authentication
    if @user.valid_otp?(auth_params[:otp])
      @user.reset_otp
      render json: login_success
    else
      render json: invalid_otp
    end
  end

  private

    def auth_params
      params.permit(:username, :password, :otp, :mobile_no)
    end

    def find_by_contact
      @user = User.find_by(contact_no: auth_params[:mobile_no])
      render_invalid_contact and return unless @user.present?
    end

    def render_invalid_contact
      render json: invalid_contact
    end

    def jwt_token
      Auth.issue({user: @user.id})
    end

    def invalid_contact
      {
        success: false,
        message: 'The mobile no entered is not present in our database . Kindly contact school to update Mobile No'
      }
    end

    def invalid_otp
      {
        success: false,
        message: "OTP didn't match"
      }
    end

    def invalid_login_details
      {
        success: false,
        message: "Invalid User Id or Password"
      }
    end

    def login_success
      #TODO add school logo
      {
        success: true,
        token: jwt_token,
        user_type: @user.role.name,
        id: @user.id,
        name: @user.full_name,
        school_name: @user.school.name.titleize,
        school_logo: ''
      }
    end

    def otp_success
      {
        success: true,
        otp: @user.otp,
        message: "OTP sent successfully"
      }
    end

end
