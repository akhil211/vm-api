class Api::V1::TokensController < Api::V1::BaseController

  skip_before_action :authenticate
  before_action :set_user, :set_class_object

  def create
    if @user.present? && @user.authenticate(auth_params[:password])
      render_success(login_data, 'Logged In Successfully')
    else
      render_error('Invalid User Id or Password')
    end
  end

  def request_otp
    @user.send_otp
    render_success( {otp: @user.otp}, 'OTP sent successfully')
  end

  def mobile_authentication
    if @user.valid_otp?(auth_params[:otp])
      @user.reset_otp
      render_success(login_data, 'Logged In Successfully')
    else
      render_error("OTP didn't match")
    end
  end

  private

    def auth_params
      params.permit(:username, :password, :otp, :mobile_no)
    end

    def set_class_object
      @obj_class = @user.role.titleize.constantize
      @user = @obj_class.find_by(username: auth_params[:username])
      @user = @obj_class.find_by(contact_no: auth_params[:mobile_no]) if @user.blank?
    end

    def set_user
      @user = ::User.find_by(username: auth_params[:username]) unless auth_params[:username].blank?
      @user = ::User.find_by(contact_no: auth_params[:mobile_no]) unless @user.present? && auth_params[:mobile_no].blank?
      render_error(invalid_contact_msg) and return unless @user.present?
    end

    def jwt_token
      Auth.issue({user: @user.id})
    end

    def invalid_contact_msg
      'The mobile no entered is not present in our database . Kindly contact school to update Mobile No'
    end

    def login_data
      #TODO add school logo
      {
        token: jwt_token,
        user_type: @user.role,
        id: @user.id,
        name: @user.full_name,
        school_name: @user.school.name.titleize,
        school_logo: @user.school.logo_url
      }
    end

end
