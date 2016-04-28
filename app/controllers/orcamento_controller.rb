class OrcamentoController < ApplicationController

  def lista
    @orcamentos = Orcamento.all
  end

  def mostrar
    orcamento = Orcamento.find(params[:id])
    @projeto = Projeto.find(orcamento.id_projeto)
  end

end
