class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true
      t.string :address_line_1, limit: 200
      t.text   :address_line_2, limit: 2000
      t.string :landmark, limit: 200
      t.string :pincode, limit: 10
      t.string :city, limit: 100
      t.string :state, limit: 100
      t.integer :address_type, default: 0, limit: 1
      t.timestamps
    end
  end
end
