class CreateStudentDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :student_details do |t|
      t.references :standard
      t.integer :student_id, index: true
      t.string  :role_no
      t.string  :admission_no
      t.date    :admission_date
      t.string  :category
      t.timestamps
    end
  end
end
