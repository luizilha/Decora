class ProjetoController < ApplicationController
  def lista
    @projetos = Projeto.all
  end

  def novo
    @projeto = Projeto.new
    @itens = Item.all
  end

  def cria
    i = Item.find(params[:item].map(&:to_i))
    @projeto = Projeto.new params_projeto
    @projeto.id_usuario = current_usuario.id
    @projeto.item = i
    if @projeto.save
      redirect_to action: 'lista'
    else
      render action: 'novo'
    end
  end

  def edita
    @projeto = Projeto.find(params[:id])
    @itens = Item.all
  end

  def altera
    i = Item.find(params[:item].map(&:to_i))
    @projeto = Projeto.find(params[:id])
    if @projeto.update_attributes params_projeto and @projeto.update_attributes(:item => i)
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
		params.require(:projeto).permit(:nome, :descricao)
	end
end
