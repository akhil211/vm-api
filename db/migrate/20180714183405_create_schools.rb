class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :board
      t.string :contact_no
      t.integer :status, default: 1
      t.timestamps
    end
  end
end
