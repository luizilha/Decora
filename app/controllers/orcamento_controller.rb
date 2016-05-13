class OrcamentoController < ApplicationController

  def lista
    @orcamentos = Orcamento.all
  end

  def mostrar
    orcamento = Orcamento.find(params[:id])
    @projeto = Projeto.find(orcamento.id_projeto)
    OrcamentoMailer.novo_orcamento(orcamento).deliver
  end

end
