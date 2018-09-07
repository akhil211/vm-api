class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.references  :standard
      t.integer     :teacher_id, index: true
      t.string      :title
      t.string      :color_code
      t.timestamps
    end
  end
end
