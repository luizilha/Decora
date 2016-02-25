class Projeto < ActiveRecord::Base
  self.table_name = 'projeto'
  has_and_belongs_to_many :item, join_table: 'item_projeto', foreign_key: 'id_projeto', association_foreign_key: 'id_item'

  validates_presence_of :nome, message: 'deve ser preenchido'
end
