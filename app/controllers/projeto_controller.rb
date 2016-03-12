class ProjetoController < ApplicationController

  def lista
    @projetos = Projeto.all
  end

  def mostra
    @projeto = Projeto.find(params[:id])
    @categorias = Categoria.all.select('nome','id_categoria').as_json
  end

  def incluiItens
    @projeto = Projeto.find(params[:id])
    @itens = Item.all
    @categorias = Categoria.all
  end

  def confirmaItens
    i = Item.find(params[:item].map(&:to_i))
    @projeto = Projeto.find(params[:id])
    if @projeto.update_attributes(:item => i)
      redirect_to action: 'mostra'
    else
      render action: 'edita'
    end
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
