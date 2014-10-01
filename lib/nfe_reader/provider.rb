# encoding: UTF-8
module Nfe
  module Reader
    # Identificação do Emitente da Nota Fiscal eletrônica
    class Provider
      include ::AttributeHelper

      attr_reader :cnpj, :cpf, :name, :phone, :state_registration, :state_registration_st,
        :city_registration, :regime, :cnae, :address, :number, :complement, :neighborhood,
        :city_code, :city, :zip_code, :country_code, :country, :fantasy, :state

      # == Fields Values
      #
      # CRT: 1 - Simples Nacional,
      #      2 - Simples Nacional – excesso de sublimite de receita bruta,
      #      3 - Regime Normal
      #
      def initialize(attrs = {})
        # Provider Info
        @cnpj = attrs[:CNPJ]
        @cpf = attrs[:CPF]
        @name = attrs[:xNome]
        @fantasy = attrs[:xFant]
        @state_registration = attrs[:IE]
        @state_registration_st = attrs[:IEST]
        @city_registration = attrs[:IM]
        @regime = attrs[:CRT]
        @cnae = attrs[:CNAE]

        # Address
        if attrs[:enderEmit]
          @phone = attrs[:enderEmit][:fone]
          @address = attrs[:enderEmit][:xLgr]
          @number = attrs[:enderEmit][:nro]
          @complement = attrs[:enderEmit][:xCpl]
          @neighborhood = attrs[:enderEmit][:xBairro]
          @city_code = attrs[:enderEmit][:cMun]
          @city = attrs[:enderEmit][:xMun]
          @zip_code = attrs[:enderEmit][:CEP]
          @country_code = attrs[:enderEmit][:cPais]
          @country = attrs[:enderEmit][:xPais]
          @state = attrs[:enderEmit][:UF]
        end
      end
    end
  end
end