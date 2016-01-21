class AddAttachmentCapaToCategoria < ActiveRecord::Migration
  def self.up
    change_table :categoria do |t|
      t.attachment :capa
    end
  end

  def self.down
    remove_attachment :categoria, :capa
  end
end
