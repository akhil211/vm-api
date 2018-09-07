class CreateHomeworks < ActiveRecord::Migration[5.1]
  def change
    create_table :homeworks do |t|
      t.references  :subject
      t.text  :description
      t.timestamps
    end
  end
end
