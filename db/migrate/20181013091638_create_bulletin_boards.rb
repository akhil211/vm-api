class CreateBulletinBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :bulletin_boards do |t|
      t.references  :school
      t.references  :admin
      t.string      :title, limit: 200
      t.text        :body, limit: 2000
      t.boolean     :sticky, default: true
      t.integer     :status, limit: 1, default: 1
      t.text        :link, limit: 500
      t.timestamps
    end
  end
end
