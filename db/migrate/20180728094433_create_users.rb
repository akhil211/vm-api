class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :school
      t.integer :guardian_id
      t.integer :role
      t.string :first_name, limit: 100
      t.string :last_name, limit: 100
      t.string :email, limit: 100
      t.string :username, limit: 50
      t.string :password_digest
      t.string :contact_no, limit: 20
      t.integer :otp
      t.string :alternate_contact_no, limit: 20
      t.string :occupation, limit: 100
      t.string :qualification, limit: 100
      t.string :gender, limit: 10
      t.string :spouse_name, limit: 100
      t.date    :joining_date
      t.date    :dob
      t.integer :status, limit: 1, default: 1
      t.timestamps
    end
  end
end
