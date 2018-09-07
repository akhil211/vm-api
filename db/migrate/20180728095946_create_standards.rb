class CreateStandards < ActiveRecord::Migration[5.1]
  def change
    create_table :standards do |t|
      t.references  :school
      t.integer     :teacher_id, index: true
      t.string      :title
      t.string      :section
      t.timestamps
    end
  end
end
