class CreateStudentAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :student_attendances do |t|
      t.integer     :student_id, index: true
      t.integer     :teacher_id
      t.date        :absent_on
      t.timestamps
    end
  end
end
