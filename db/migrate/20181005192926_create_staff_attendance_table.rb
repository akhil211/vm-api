class CreateStaffAttendanceTable < ActiveRecord::Migration[5.1]
  def change
    create_table :staff_attendances do |t|
      t.references  :teacher
      t.integer     :admin_id, index: true
      t.date        :absent_on
      t.timestamps
    end
  end
end
