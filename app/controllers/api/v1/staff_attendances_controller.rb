class Api::V1::StaffAttendancesController < Api::V1::BaseController

  before_action :set_teacher, only: [:show]

  def show
    attendances = obj_array(@teacher.attendances, 'AttendanceSerializer')
    data = { id: @teacher.id, name: @teacher.full_name, absent_on: attendances }
    render_success(data)
  end

  private

  def set_teacher
    @teacher = Teacher.find_by(id: params[:id])
    render_error('Teacher not found') and return unless @teacher.present?
  end

end
