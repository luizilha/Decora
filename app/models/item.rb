class Item < ActiveRecord::Base
	self.table_name = 'item'
	belongs_to :categoria, foreign_key: 'id_categoria'

	has_attached_file :foto, styles: { original: "500x500>", medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :foto, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
