# encoding: UTF-8
module NfeReader
  # Pessoas Autorizadas para obter XML
  class Authorization
    include AttributeHelper

    attr_reader :cnpj, :cpf

    def initialize(attrs = {})
      @cnpj = attrs[:CNPJ]
      @cpf = attrs[:CPF]
    end
  end
end