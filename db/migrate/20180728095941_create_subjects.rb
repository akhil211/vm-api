class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.references  :section
      t.integer     :teacher_id, index: true
      t.string      :title, limit: 100
      t.string      :color_code, limit: 10
      t.integer     :status, limit: 1, default: 1
      t.timestamps
    end
  end
end
