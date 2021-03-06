class ProjetoController < ApplicationController
  before_action :authenticate_usuario!, :except => [:lista, :mostra]

  def lista
    @projetos = Projeto.all
    respond_to do |format|
      format.html
      format.json { render json: @projetos.as_json(only: [:id_projeto, :nome, :descricao], methods: [:capa_url]) }
    end
  end

  def mostra
    @projeto = Projeto.find(params[:id])
    @categorias = Categoria.all.select('nome','id_categoria').as_json
    respond_to do |format|
      format.html do
        if !usuario_signed_in?
          redirect_to '/usuario/login'
        end
      end
      format.json { render json: @projeto.as_json(only: [:nome, :descricao], methods: [:capa_url, :itens_json]) }
    end
  end

  def incluiItens
    @projeto = Projeto.find(params[:id])
    @itens = Item.all
    @categorias = Categoria.all.select('nome','id_categoria').as_json
  end

  def retiraItem
    projeto = Projeto.find(params[:id_projeto])
    projeto.item.delete(Item.find(params[:id]))
    redirect_to action: 'mostra', id: params[:id_projeto]
  end

  def confirmaItens
    i = Item.find(params[:item].map(&:to_i))
    @projeto = Projeto.find(params[:id])
    @projeto.item.concat i
    redirect_to action: 'mostra'
  end

  def novo
    @projeto = Projeto.new
  end

  def cria
    @projeto = Projeto.new params_projeto
    @projeto.id_usuario = current_usuario.id
    if @projeto.save
      redirect_to action: 'lista'
    else
      render action: 'novo'
    end
  end

  def edita
    @projeto = Projeto.find(params[:id])
  end

  def altera
    @projeto = Projeto.find(params[:id])
    if @projeto.update_attributes params_projeto
      redirect_to action: 'lista'
    else
      render action: 'edita'
    end
  end

  def deleta
    @projeto = Projeto.find(params[:id])
    @projeto.destroy
    redirect_to action: 'lista'
  end

  def params_projeto
		params.require(:projeto).permit(:nome, :descricao, :capa)
	end
end
