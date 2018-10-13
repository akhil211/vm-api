class CreateExamGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_groups do |t|
      t.references  :standard
      t.string  :title, limit: 100
      t.string  :color_code, limit: 10
      t.integer :display_type, limit: 1, default: 0
      t.integer :status, limit: 1, default: 1
      t.timestamps
    end
  end
end
