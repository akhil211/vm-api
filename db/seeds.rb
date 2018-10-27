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

  school = School.find_or_create_by!(name: 'test school name', landline_no_1: '9898989898', board: 'CBSE', landline_no_2: '6567878909', fax: '3456678', email_id: 'first@school.com', website: 'https://www.google.co.in')

  school.build_address(address_line_1: '#70', address_line_2: 'sadar', city: 'ambala', state: 'haryana', pincode: '123456').save!

  teacher = Teacher.find_or_create_by!(first_name: 'teacher', last_name: 'sharma', gender: 'male', status: 1, qualification: 'b.tech',  school: school, contact_no: '5656789098', dob: 20.years.ago, alternate_contact_no: '5656789098', joining_date: 2.years.ago)
  principal = Principal.find_or_create_by!(first_name: 'principal', last_name: 'sharma', gender: 'male', status: 1, qualification: 'm.tech', school: school, contact_no: '5656789054', dob: 30.years.ago, alternate_contact_no: '5654389098', joining_date: 5.years.ago)

  Address.find_or_create_by!(addressable: teacher, address_line_1: '#70', address_line_2: 'sadar', city: 'ambala', state: 'haryana', pincode: '123456', address_type: 0)
  Address.find_or_create_by!(addressable: teacher, address_line_1: '#72', address_line_2: 'sadar', city: 'kaithal', state: 'haryana', pincode: '656789', address_type: 1)

  admin = Admin.create(first_name: 'admin', last_name: 'sharma', gender: 'male', status: 1, qualification: 'b.tech', role: 2, school: school, contact_no: '5656789034', username: 'admin',password: 'admin123')

  Address.find_or_create_by!(addressable: admin, address_line_1: '#73', address_line_2: 'rai wala', city: 'ynr', state: 'haryana', pincode: '454345', address_type: 0)

  standard = Standard.find_or_create_by!(title: '1', school: school)

  section  = Section.find_or_create_by!(name: 'a', standard: standard, teacher_id: teacher.id)

  guardian = Guardian.find_or_create_by!(first_name: 'parent', last_name: 'sharma', gender: 'male', status: 1, qualification: 'mba', role: 1, contact_no: '5653589098', spouse_name: 'mother name', occupation: 'salaried')

  student = Student.find_or_create_by!(first_name: 'student', last_name: 'sharma', gender: 'male', school: school, guardian_id: guardian.id, dob: Date.today, role: 5, contact_no: '2343456567')

  student_detail = StudentDetail.find_or_create_by!(student: student, admission_no: '123', roll_no: '1', admission_date: 1.year.ago, section: section, category: 'general')

  Address.find_or_create_by!(addressable: student, address_line_1: '#75', address_line_2: 'mahesh nagar', city: 'kkr', state: 'haryana', pincode: '987653', address_type: 0)
  Address.find_or_create_by!(addressable: student, address_line_1: '#76', address_line_2: 'rohini', city: 'gurgaon', state: 'haryana', pincode: '234321', address_type: 0)

  subject1 = Subject.find_or_create_by!(section: section, teacher: teacher, title: 'Hindi')
  subject2 = Subject.find_or_create_by!(section: section, teacher: teacher, title: 'english')
  subject3 = Subject.find_or_create_by!(section: section, teacher: teacher, title: 'maths')

  Homework.find_or_create_by!(subject: subject1, description: 'complete chapter 1', date: Date.today)
  Homework.find_or_create_by!(subject: subject1, description: 'complete chapter 2', date: 2.days.ago)
  Homework.find_or_create_by!(subject: subject2, description: 'complete chapter 2', date: Date.today)
  Homework.find_or_create_by!(subject: subject2, description: 'complete chapter 3', date: 2.days.ago)
  Homework.find_or_create_by!(subject: subject3, description: 'complete chapter 3', date: Date.today)
  Homework.find_or_create_by!(subject: subject3, description: 'complete chapter 4', date: 2.days.ago)

  StudentAttendance.find_or_create_by!(student: student, teacher: teacher, absent_on: Date.today)
  StudentAttendance.find_or_create_by!(student: student, teacher: teacher, absent_on: 4.days.ago)

  StaffAttendance.find_or_create_by!(teacher: teacher, admin: admin, absent_on: Date.today)
  StaffAttendance.find_or_create_by!(teacher: teacher, admin: admin, absent_on: 9.days.ago)

  StudentPreviousDetail.find_or_create_by!(student: student, school: 'SBBM', year: '2018', board: 'haryana board of education', standard: '8th', reason_of_leaving: "father's job transfer")

  exam_group = ExamGroup.find_or_create_by!(section: section, title: 'semester 1')
  exam1 = Exam.find_or_create_by!(exam_group: exam_group, subject: subject1, maximum_marks: 100, passing_marks: 33, subject_code: '101', date: 4.days.ago)
  exam2 = Exam.find_or_create_by!(exam_group: exam_group, subject: subject2, maximum_marks: 100, passing_marks: 33, subject_code: '102', date: 14.days.ago)
  exam3 = Exam.find_or_create_by!(exam_group: exam_group, subject: subject3, maximum_marks: 100, passing_marks: 33, subject_code: '103', date: Date.today + 15.days)

  ExamResult.find_or_create_by!(exam: exam1, student: student, marks_obtained: '40', grade: 'c')
  ExamResult.find_or_create_by!(exam: exam2, student: student, marks_obtained: '50', grade: 'b')
  ExamResult.find_or_create_by!(exam: exam3, student: student, marks_obtained: '70', grade: 'a')

  Event.find_or_create_by!(school: school, admin: admin, title: 'Mahashivratri', description: 'Mahashivratri celebrations', starts_at: 10.days.ago, ends_at: 9.days.ago)
  Event.find_or_create_by!(school: school, admin: admin, title: 'Diwali', description: 'Diwali celebrations', starts_at: 10.days.from_now, ends_at: 11.days.from_now)

  BulletinBoard.find_or_create_by!(school: school, admin: admin, title: 'PTM', body: 'PTM on 20th', link: 'https://stackoverflow.com')
  BulletinBoard.find_or_create_by!(school: school, admin: admin, title: 'Exams', body: 'Unit tests from 27th', link: 'https://stackoverflow.com')

  Alert.find_or_create_by!(user_id: teacher.id, message: 'Diwali celebrations on 20th')
  Alert.find_or_create_by!(user_id: teacher.id, message: 'School will remain closed on 26th')
  Alert.find_or_create_by!(user_id: guardian.id, message: 'School will remain closed on 26th')
  Alert.find_or_create_by!(user_id: guardian.id, message: 'PTM on 27th')

  Album.find_or_create_by!(school: school, name: 'Independece day celebrations')
  Album.find_or_create_by!(school: school, name: 'Annual fuction celebrations')

end
