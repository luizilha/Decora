class Categoria < ActiveRecord::Base
  self.table_name = 'categoria'

  has_attached_file :capa, styles: { medium: "300x300>", thumb: "100x100>" }, convert_options: {:thumb => '-resize 100x100'}
  validates_with AttachmentSizeValidator, attributes: :capa, less_than: 1.megabytes
	validates_attachment_content_type :capa, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_presence_of :nome, message: "deve preencher campo nome"
  belongs_to :admin

end
