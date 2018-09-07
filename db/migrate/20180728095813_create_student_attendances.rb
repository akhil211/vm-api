class CreateStudentAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :student_attendances do |t|
      t.references  :student
      t.integer     :teacher_id, index: true
      t.date        :absent_on
      t.timestamps
    end
  end
end
