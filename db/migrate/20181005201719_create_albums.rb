class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.references :school
      t.string     :name, limit: 100
      t.integer    :status, limit: 1, default: 1
      t.timestamps
    end
  end
end
