class OrcamentoMailer < ActionMailer::Base
  default from: "luiz.ilha7@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.orcamento_mailer.novo_orcamento.subject
  #
  def novo_orcamento(orcamento)
    @usuario = Usuario.find(orcamento.id_usuario)
    @projeto = Projeto.find(orcamento.id_projeto)
    mail to: @usuario.email, subject: "Orcamento da DeCorazon pra você #{@usuario.nome}"
  end
end
