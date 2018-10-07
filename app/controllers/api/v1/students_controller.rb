class Api::V1::StudentsController < Api::V1::BaseController

  before_action :set_student

  def attendances
    attendances = obj_array(@student.attendances, 'Student::AttendanceSerializer')
    data = {id: @student.id, name: @student.full_name, std: @student.standard.name, absent_on: attendances }
    render_success(data)
  end

  def homework_dates
    homeworks = obj_array(@student.homeworks, 'Student::HomeworkDatesSerializer')
    render_success({dates: homeworks})
  end

  def homework_details
    date = params[:date] || Date.today
    homeworks = @student.homeworks.where(date: date.to_date)
    homeworks = obj_array(homeworks, 'Student::HomeworkDetailsSerializer')
    render_success({homeworks: homeworks})
  end

  private

  def set_student
    @student = Student.find_by(id: params[:id])
    render_error('Record not found') and return unless @student.present?
  end

end
