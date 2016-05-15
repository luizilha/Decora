class Projeto < ActiveRecord::Base
  self.table_name = 'projeto'
  has_and_belongs_to_many :item, join_table: 'item_projeto', foreign_key: 'id_projeto', association_foreign_key: 'id_item'
  has_many :orcamento
  belongs_to :usuario

  has_attached_file :capa, styles: { original: "500x500>" }, url: '/uploads/:class/:attachment/:id/:style_:filename', path: ':rails_root/public/uploads/:class/:attachment/:id/:style_:filename'
  validates_attachment_content_type :capa, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"], message: 'Arquivo deve ser imagem!'
  validates_presence_of :nome, message: 'deve ser preenchido'

  def capa_url
    capa.url(:original)
  end

  def itens_json
    self.item.as_json(only: [:nome, :descricao], methods: [:foto_url])
  end
end
