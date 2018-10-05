class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :role
      t.references :school
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :contact_no
      t.integer :otp
      t.string :alternate_contact_no
      t.text :home_address
      t.text :office_address
      t.string :occupation
      t.string :qualification
      t.string :gender
      t.string :spouse_name
      t.integer :status, limit: 1, default: 1
      t.timestamps
    end
  end
end
