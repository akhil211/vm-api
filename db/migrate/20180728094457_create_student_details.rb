class CreateStudentDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :student_details do |t|
      t.references :standard
      t.integer :student_id, index: true
      t.string  :role_no, limit: 50
      t.string  :admission_no, limit: 100
      t.date    :admission_date
      t.string  :category, limit: 50
      t.timestamps
    end
  end
end
