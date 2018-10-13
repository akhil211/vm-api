class CreateStandards < ActiveRecord::Migration[5.1]
  def change
    create_table :standards do |t|
      t.references  :school
      t.integer     :teacher_id, index: true
      t.string      :title, limit: 100
      t.string      :section, limit: 20
      t.integer     :status, limit: 1, default: 1
      t.timestamps
    end
  end
end
