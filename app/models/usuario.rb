class Usuario < ActiveRecord::Base
  self.table_name = 'usuario'
  has_many :orcamento
  has_many :projeto
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
