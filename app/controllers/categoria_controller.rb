class CategoriaController < ApplicationController
  before_action :authenticate_usuario!, :except => [:index]

  def index
    @msg = params[:msg]
    @categorias = Categoria.order(:id_categoria)
      respond_to do |format|
        format.html do
          if !usuario_signed_in?
            redirect_to '/usuario/login'
          end
        end
        format.json {render json: @categorias.as_json(only: [:nome, :id_categoria, :descricao], :methods => [:capa_url])}
      end
  end

  def novo
    @categoria = Categoria.new
  end

  def cria
    @categoria = Categoria.new params_categoria    
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
    if @categoria.item.size == 0
      @categoria.destroy
      redirect_to action: 'index'
    else
      redirect_to action: 'index', msg: 'erro'
    end

  end

  def params_categoria
    params.require(:categoria).permit(:nome, :descricao, :capa)
  end
end
