class ProjetoController < ApplicationController
  def lista
    @projetos = Projeto.all
  end
end
