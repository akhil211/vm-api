class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.references  :exam_group
      t.references  :subject
      t.string      :subject_code, limit: 20
      t.decimal     :maximum_marks, precision: 4, scale: 1
      t.decimal     :passing_marks, precision: 4, scale: 1
      t.timestamp   :date
      t.boolean     :is_result_published, default: false
      t.integer     :status, limit: 1, default: 1
      t.timestamps
    end
  end
end
