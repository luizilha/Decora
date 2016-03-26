class Item < ActiveRecord::Base
	self.table_name = 'item'
	belongs_to :categoria
	has_and_belongs_to_many :projeto, join_table: 'item_projeto',foreign_key: 'id_item',  association_foreign_key: 'id_projeto'

	has_attached_file :foto, styles: { original: "500x500>" }, url: '/uploads/:class/:attachment/:id/:style_:filename', path: ':rails_root/public/uploads/:class/:attachment/:id/:style_:filename'
	validates_attachment_content_type :foto, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_presence_of :foto, message: 'tem que ser preenchido'
	validates_presence_of :nome, message: 'tem que ser preenchido'
	validates_presence_of :id_categoria, message: 'tem que ser preenchido'
	validates_presence_of :preco, message: 'tem que ser preenchido'
	validates_presence_of :preco_reposicao, message: 'tem que ser preenchido'
	validates_length_of :quantidade, minimum: 0, too_short: 'valor invalido deve ser maior que 0'

	def foto_url
		foto.url(:original)
	end
end
