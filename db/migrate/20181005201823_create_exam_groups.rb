class CreateExamGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_groups do |t|
      t.references  :standard
      t.string  :title
      t.string  :color_code
      t.boolean :is_result_published, default: false
      t.integer :display_type, limit: 1, default: 0
      t.integer :status, limit: 1, default: 1
      t.timestamps
    end
  end
end
