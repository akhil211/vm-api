class AddAttachmentFileToAttachments < ActiveRecord::Migration[5.1]
  def self.up
    create_table :attachments do |t|
      t.attachment :file
      t.string     :title, limit: 200
      t.belongs_to :attachable, polymorphic: true
      t.integer    :status, limit: 1, default: 1
      t.integer    :type, default: 0, limit: 1
      t.timestamps
    end
  end

end
