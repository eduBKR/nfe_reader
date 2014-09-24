# encoding: UTF-8
module Nfe
  class Carrier
    attr_reader :cnpj, :cpf, :name, :ie, :address, :city, :state

    def initialize(attrs = {})
      @cnpj = attrs[:CNPJ]
      @cpf = attrs[:CPF]
      @name = attrs[:xNome]
      @ie = attrs[:IE]
      @address = attrs[:xEnder]
      @city = attrs[:xMun]
      @state = attrs[:UF]
    end
  end
end