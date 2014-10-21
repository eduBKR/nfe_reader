# encoding: UTF-8
module Nfe
  module Reader
    class Carrier
      include AttributeHelper

      attr_reader :cnpj, :cpf, :name, :state_registration, :address, :city, :state

      def initialize(attrs = {})
        @cnpj = attrs[:CNPJ]
        @cpf = attrs[:CPF]
        @name = attrs[:xNome]
        @state_registration = attrs[:IE]
        @address = attrs[:xEnder]
        @city = attrs[:xMun]
        @state = attrs[:UF]
      end
    end
  end
end