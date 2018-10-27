class Api::V1::TeachersController < Api::V1::BaseController

  before_action :set_teacher

  def classes
    sections = obj_array(@teacher.sections, 'SectionsSerializer')
    render_success(sections)
  end

  def show
    render_success(TeacherSerializer.new(@teacher))
  end

  private

  def set_teacher
    @teacher = Teacher.find_by(id: params[:id])
    render_error('Teacher not found') and return unless @teacher.present?
  end

end
