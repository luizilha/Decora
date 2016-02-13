class CategoriaController < ApplicationController
  before_action :authenticate_usuario!

  def index
    @categorias = Categoria.all
  end

  def novo
    @categoria = Categoria.new
  end

  def cria
    @categoria = Categoria.new params_categoria
    @categoria.id_admin = current_admin.id
    @categoria.save
    redirect_to action: 'index'
  end

  def edita
    @categoria = Categoria.find(params[:id])
  end

  def altera
    @categoria = Categoria.find(params[:id])
    @categoria.update_attributes params_categoria
    redirect_to action: 'index'
  end

  def deleta
    @categoria = Categoria.find(params[:id])
    @categoria.destroy
    redirect_to action: 'index'
  end

  def params_categoria
    params.require(:categoria).permit(:nome, :descricao, :capa)
  end
end
