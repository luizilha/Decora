class CategoriaController < ApplicationController
  before_action :authenticate_usuario!

  def index
    @categorias = Categoria.order(:id_categoria)
  end

  def novo
    @categoria = Categoria.new
  end

  def cria
    @categoria = Categoria.new params_categoria
    @categoria.id_usuario = current_usuario.id
    if @categoria.save
      redirect_to action: 'index'
    else
      render action: 'novo'
    end
  end

  def edita
    @categoria = Categoria.find(params[:id])
  end

  def altera
    @categoria = Categoria.find(params[:id])
    if @categoria.update_attributes params_categoria
      redirect_to action: 'index'
    else
      render action: 'edita'
    end
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
