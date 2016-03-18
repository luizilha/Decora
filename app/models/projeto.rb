class Projeto < ActiveRecord::Base
  self.table_name = 'projeto'
  has_and_belongs_to_many :item, join_table: 'item_projeto', foreign_key: 'id_projeto', association_foreign_key: 'id_item'

  has_attached_file :capa, styles: { original: "500x500>" }
  validates_attachment_content_type :capa, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"], message: 'Arquivo deve ser imagem!'
  validates_presence_of :nome, message: 'deve ser preenchido'
end