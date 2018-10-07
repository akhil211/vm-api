# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do

  # master_role = Role.find_or_create_by!(name: 'master')
  # admin_role = Role.find_or_create_by!(name: 'admin')
  # student_role = Role.find_or_create_by!(name: 'student')
  # teacher_role = Role.find_or_create_by!(name: 'teacher')
  # guardian_role = Role.find_or_create_by!(name: 'guardian')
  # principal_role = Role.find_or_create_by!(name: 'principal')

  school = School.find_or_create_by!(name: 'test school name', city: 'ambala', state: 'haryana', contact_no: '9898989898', board: 'CBSE')

  teacher = Teacher.find_or_create_by!(first_name: 'teacher', last_name: 'sharma', gender: 'male', status: 1, qualification: 'b.tech', role: 3, school: school, contact_no: '5656789098', dob: 20.years.ago, alternate_contact_no: '5656789098', joining_date: 2.years.ago, home_address: 'sadar bazar')

  admin = Admin.create(first_name: 'admin', last_name: 'sharma', gender: 'male', status: 1, qualification: 'b.tech', role: 2, school: school, contact_no: '5656789034', username: 'admin',password: 'admin123')

  standard = Standard.find_or_create_by!(title: '1', section: 'A', school: school, teacher_id: teacher.id)

  guardian = Guardian.find_or_create_by!(first_name: 'parent', last_name: 'sharma', gender: 'male', status: 1, qualification: 'mba', role: 1, contact_no: '5653589098', spouse_name: 'mother name', occupation: 'salaried')

  student = Student.find_or_create_by!(first_name: 'student', last_name: 'sharma', gender: 'male', school: school, guardian_id: guardian.id, dob: Date.today, role: 5, contact_no: '2343456567', home_address: 'banur')

  student_detail = StudentDetail.find_or_create_by!(student: student, admission_no: '123', role_no: '1', admission_date: 1.year.ago, standard: standard, category: 'general')

  subject1 = Subject.find_or_create_by!(standard: standard, teacher: teacher, title: 'Hindi')
  subject2 = Subject.find_or_create_by!(standard: standard, teacher: teacher, title: 'english')
  subject3 = Subject.find_or_create_by!(standard: standard, teacher: teacher, title: 'maths')

  Homework.find_or_create_by!(subject: subject1, description: 'complete chapter 1', date: Date.today)
  Homework.find_or_create_by!(subject: subject1, description: 'complete chapter 2', date: 2.days.ago)
  Homework.find_or_create_by!(subject: subject2, description: 'complete chapter 2', date: Date.today)
  Homework.find_or_create_by!(subject: subject2, description: 'complete chapter 3', date: 2.days.ago)
  Homework.find_or_create_by!(subject: subject3, description: 'complete chapter 3', date: Date.today)
  Homework.find_or_create_by!(subject: subject3, description: 'complete chapter 4', date: 2.days.ago)

  StudentAttendance.find_or_create_by!(student: student, teacher: teacher, absent_on: Date.today)
  StudentAttendance.find_or_create_by!(student: student, teacher: teacher, absent_on: 4.days.ago)

  StaffAttendance.find_or_create_by!(user: teacher, admin: admin, absent_on: Date.today)
  StaffAttendance.find_or_create_by!(user: teacher, admin: admin, absent_on: 9.days.ago)

  StudentPreviousDetail.find_or_create_by!(student: student, school: 'SBBM', year: '2018', board: 'haryana board of education', standard: '8th', reason_of_leaving: "father's job transfer")

  exam_group = ExamGroup.find_or_create_by!(standard: standard, title: 'semester 1')
  exam1 = Exam.find_or_create_by!(exam_group: exam_group, subject: subject1, maximum_marks: 100, passing_marks: 33, subject_code: '101', date: 4.days.ago)
  exam2 = Exam.find_or_create_by!(exam_group: exam_group, subject: subject2, maximum_marks: 100, passing_marks: 33, subject_code: '102', date: 14.days.ago)
  exam3 = Exam.find_or_create_by!(exam_group: exam_group, subject: subject3, maximum_marks: 100, passing_marks: 33, subject_code: '103', date: Date.today + 15.days)

  ExamResult.find_or_create_by!(exam: exam1, student: student, marks_obtained: '40', grade: 'c')
  ExamResult.find_or_create_by!(exam: exam2, student: student, marks_obtained: '50', grade: 'b')
  ExamResult.find_or_create_by!(exam: exam3, student: student, marks_obtained: '70', grade: 'a')

end
