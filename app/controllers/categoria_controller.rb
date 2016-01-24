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

  def edita
    @categoria = Categoria.find(params[:id])
  end

  def altera
    @categoria = Categoria.find(params[:id])
    @categoria.update_attributes parametros_categoria
    redirect_to action: 'index'
  end

  def deleta
    @categoria = Categoria.find(params[:id])
    @categoria.destroy
    redirect_to action: 'index'
  end

  def parametros_categoria
    params.require(:categoria).permit(:nome, :descricao, :capa)
  end
end
