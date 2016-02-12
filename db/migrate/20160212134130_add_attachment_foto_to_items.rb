class AddAttachmentFotoToItems < ActiveRecord::Migration
  def self.up
    change_table :item do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :item, :foto
  end
end
