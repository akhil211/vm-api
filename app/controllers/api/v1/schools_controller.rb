class Api::V1::SchoolsController < Api::V1::BaseController

  before_action :set_school

  def show
    render_success(SchoolSerializer.new(@school))
  end

  def teachers
  	teachers = obj_array(@school.teachers, 'Principal::TeachersSerializer')
    render_success({teachers: teachers})
  end

  private

  def set_school
    @school = School.find_by(id: params[:id])
    render_error('school not found') and return unless @school.present?
  end

end
