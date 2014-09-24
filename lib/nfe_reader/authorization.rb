# encoding: UTF-8
module Nfe
  # Pessoas Autorizadas para obter XML
  class Authorization
    attr_reader :cnpj, :cpf

    def initialize(attrs = {})
      @cnpj = attrs[:CNPJ]
      @cpf = attrs[:CPF]
    end
  end
end