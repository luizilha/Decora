require 'test_helper'

class OrcamentoMailerTest < ActionMailer::TestCase
  test "novo_orcamento" do
    mail = OrcamentoMailer.novo_orcamento
    assert_equal "Novo orcamento", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
