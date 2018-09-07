class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_school, only: [:school_profile]

  def profile
    render_success({user: UserSerializer.new(@current_user)})
  end

  def school_profile
    if @school.present?
      render_success({school: SchoolSerializer.new(@school)})
    else
      render_error('Record not found')
    end
  end

  private

  def set_school
    @school = @current_user.try(:school)
    if @school.blank? && params[:student_id].present?
      @school = @current_user.spouses.where(student_id: params[:student_id]).try(:first)
    end
  end

end
