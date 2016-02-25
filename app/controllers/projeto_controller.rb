class ProjetoController < ApplicationController
  def lista
    @projetos = Projeto.all
  end

  def novo
    @projeto = Projeto.new
  end

  def cria
    @projeto = Projeto.new params_projeto
    if @projeto.save
      redirect_to action: 'lista'
    else
      render action: 'novo'
    end
  end

  def params_projeto
		params.require(:projeto).permit(:nome, :descricao)
	end
end
