# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

master_role = Role.find_or_create_by!(name: 'master')
admin_role = Role.find_or_create_by!(name: 'admin')
teacher_role = Role.find_or_create_by!(name: 'teacher')
parent_role = Role.find_or_create_by!(name: 'parent')
principal_role = Role.find_or_create_by!(name: 'principal')

school = School.find_or_create_by!(name: 'test school name', city: 'ambala', state: 'haryana', contact_no: '9898989898', board: 'CBSE')

teacher = User.find_or_create_by!(first_name: 'teacher', last_name: 'kumar', gender: 'm', status: 1, qualification: 'b.tech', role: teacher_role, school: school, contact_no: '5656789098')

standard = Standard.find_or_create_by!(title: '1', section: 'A', school: school, teacher_id: teacher.id)

parent = User.find_or_create_by!(first_name: 'parent', last_name: 'kumar', gender: 'm', status: 1, qualification: 'mba', role: parent_role, school: school, contact_no: '5653589098', spouse_name: 'mother name')

student = Student.find_or_create_by!(first_name: 'student', last_name: 'kumar', gender: 'm', role_no: '1', school: school, parent_id: parent.id, standard: standard, admission_no: '123', dob: Date.today)
