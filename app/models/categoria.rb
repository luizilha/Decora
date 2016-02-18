class Categoria < ActiveRecord::Base
	self.table_name = 'categoria'
	self.primary_key = 'id_categoria'
	belongs_to :admin
	has_many :item, foreign_key: 'id_categoria', dependent: :delete_all
	#Validacoes
	has_attached_file :capa, styles: { original: "500x500>" }
	validates_attachment_content_type :capa, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_presence_of :nome, message: "deve preencher campo nome"
end
