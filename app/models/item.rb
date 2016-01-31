class Item < ActiveRecord::Base
	self.table_name = 'item'
	belongs_to :categoria, foreign_key: 'id_categoria'
end
