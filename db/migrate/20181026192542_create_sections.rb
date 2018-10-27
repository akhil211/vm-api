class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
    	t.references :standard
    	t.integer     :teacher_id, index: true
    	t.string	:name, limit: 20
    	t.integer     :status, limit: 1, default: 1
      	t.timestamps
    end
  end
end
