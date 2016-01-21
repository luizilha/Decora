class Categoria < ActiveRecord::Base
  self.table_name = 'categoria'

  has_attached_file :capa, styles: { medium: "300x300>", thumb: "100x100>" }

	validates_attachment_content_type :capa, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_presence_of :nome, message: "deve preencher campo nome"
  belongs_to :admin
  
end