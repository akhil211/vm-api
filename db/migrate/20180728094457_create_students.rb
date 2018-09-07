class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.references :school
      t.references :standard
      t.integer :parent_id, index: true
      t.string  :first_name
      t.string  :last_name
      t.string  :role_no
      t.string  :admission_no
      t.date    :admisssion_date
      t.string  :category
      t.date    :dob
      t.string  :gender
      t.timestamps
    end
  end
end
