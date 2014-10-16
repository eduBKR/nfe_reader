module Nfe
  module Reader
    class Address
      include AttributeHelper

      attr_reader :address, :number, :complement, :neighborhood,
        :city_code, :city, :zip_code, :state, :country_code, :country,
        :phone, :cnpj, :cpf

      def initialize(attrs= {})
        # CNPJ
         @cnpj = attrs[:CNPJ]
        # CPF
        @cpf = attrs[:CPF]
        # Logradouo
        @address = attrs[:xLgr]
        # Numero
        @number = attrs[:nro]
        # Complemento
        @complement = attrs[:xCpl]
        # Bairro
        @neighborhood = attrs[:xBairro]
        # Codigo IBGE Cidade
        @city_code = attrs[:cMun]
        # Nome Cidade
        @city = attrs[:xMun]
        # CEP
        @zip_code = attrs[:CEP]
        # Estado
        @state = attrs[:UF]
        # Codigo Pais
        @country_code = attrs[:cPais]
        # Pais
        @country = attrs[:xPais]
        # Telefone
        @phone = attrs[:fone]
      end
    end
  end
end