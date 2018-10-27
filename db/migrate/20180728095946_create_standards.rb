class CreateStandards < ActiveRecord::Migration[5.1]
  def change
    create_table :standards do |t|
      t.references  :school
      t.string      :title, limit: 100
      t.integer     :status, limit: 1, default: 1
      t.timestamps
    end
  end
end
