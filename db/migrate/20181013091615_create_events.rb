class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :school
      t.references :admin
      t.string  :title, limit: 200
      t.text    :description, limit: 2000
      t.timestamp :starts_at
      t.timestamp :ends_at
      t.integer     :status, limit: 1, default: 1
      t.timestamps
    end
  end
end
