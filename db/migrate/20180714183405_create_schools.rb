class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name, limit: 250
      t.string :board, limit: 50
      t.string :landline_no_1, limit: 20
      t.string :landline_no_2, limit: 20
      t.string :fax, limit: 100
      t.string :website, limit: 200
      t.string :email_id, limit: 100
      t.integer :status, limit: 1, default: 1
      t.timestamps
    end
  end
end
