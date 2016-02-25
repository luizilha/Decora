class AddAttachmentCapaToProjetos < ActiveRecord::Migration
  def self.up
    change_table :projeto do |t|
      t.attachment :capa
    end
  end

  def self.down
    remove_attachment :projeto, :capa
  end
end
