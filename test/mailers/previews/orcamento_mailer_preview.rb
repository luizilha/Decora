# Preview all emails at http://localhost:3000/rails/mailers/orcamento_mailer
class OrcamentoMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/orcamento_mailer/novo_orcamento
  def novo_orcamento
    orcamento = Orcamento.last
    OrcamentoMailer.novo_orcamento(orcamento)
  end

end
