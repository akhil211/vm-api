class CreateExamResults < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_results do |t|
      t.references :exam
      t.references :student
      t.decimal   :marks_obtained
      t.string   :grade
      t.timestamps
    end
  end
end
