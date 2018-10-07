class CreateHomeworks < ActiveRecord::Migration[5.1]
  def change
    create_table :homeworks do |t|
      t.references  :subject
      t.text        :description
      t.date        :date
      t.integer     :status, limit: 1, default: 1
      t.timestamps
    end
  end
end
