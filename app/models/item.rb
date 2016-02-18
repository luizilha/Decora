class Item < ActiveRecord::Base
	self.table_name = 'item'
	belongs_to :categoria

	has_attached_file :foto, styles: { original: "500x500>" }
	validates_attachment_content_type :foto, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
