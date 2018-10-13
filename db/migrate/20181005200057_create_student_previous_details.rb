class CreateStudentPreviousDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :student_previous_details do |t|
      t.references  :student
      t.string  :school, limit: 100
      t.string  :board, limit: 50
      t.integer :year, limit: 4
      t.string  :standard, limit: 20
      t.string  :reason_of_leaving, limit: 200
      t.text    :school_address, limit: 2000
      t.decimal :percentage, precision: 4, scale: 1
      t.timestamps
    end
  end
end
