class CreateAlerts < ActiveRecord::Migration[5.1]
  def change
    create_table :alerts do |t|
      t.references :user
      t.text :message, limit: 2000
      t.boolean :is_read, default: false
      t.timestamps
    end
  end
end
