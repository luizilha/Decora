class Orcamento < ActiveRecord::Base
  self.table_name = "orcamento"
  belongs_to :usuario
  belongs_to :projeto
  
end
