class CreateStudentPreviousDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :student_previous_details do |t|
      t.references  :student
      t.string  :school
      t.string  :board
      t.string  :year
      t.string  :standard
      t.string  :reason_of_leaving
      t.text    :school_address
      t.decimal :percentage
      t.timestamps
    end
  end
end
