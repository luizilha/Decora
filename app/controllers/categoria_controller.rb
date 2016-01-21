class CategoriaController < ApplicationController
  before_action :authenticate_admin!
  def index
    @categorias = Categoria.all
  end

  def novo
		@categoria = Categoria.new
	end

	def cria
		@categoria = Categoria.new parametros_categoria
    @categoria.id_admin = current_admin.id 
		@categoria.save
		redirect_to action: 'index'
	end

  def parametros_categoria
		params.require(:categoria).permit(:nome, :descricao, :capa)
	end
end
