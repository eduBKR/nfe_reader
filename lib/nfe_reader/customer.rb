# encoding: UTF-8
module Nfe
  module Reader
    # Identificação do Destinatário da Nota Fiscal eletrônica
    class Customer
      include ::AttributeHelper

      attr_reader :cnpj, :cpf, :name, :state_registration, :email,
        :suframa, :phone, :address, :number, :neighborhood, :city_code,
        :city, :state, :country_code, :country, :complement, :foreign_code,
        :zip_code, :city_registration, :state_registration_code

      # == Fields Values
      #
      # indIEDest: 1 - Contribuinte ICMS (informar a IE do destinatário),
      #            2 - Contribuinte isento de Inscrição no cadastro de Contribuintes do ICMS,
      #            9 - Não Contribuinte, que pode ou não possuir Inscrição Estadual

      def initialize(attrs = {})
        @cnpj = attrs[:CNPJ]
        @cpf = attrs[:CPF]

        # Razão Social ou nome do destinatário
        @name = attrs[:xNome]
        # Inscrição Estadual do Destinatário
        @state_registration = attrs[:IE]
        # Inscrição na SUFRAMA
        @suframa = attrs[:ISUF]
        # Inscrição Municipal do Tomador do Serviço
        @city_registration = attrs[:IM]
        # Indicador da IE do Destinatário
        @state_registration_code = attrs[:indIEDest]
        # Email
        @email = attrs[:email]
        # Identificação do destinatário no caso de comprador estrangeiro
        @foreign_code = attrs[:idEstrangeiro]

        # Address
        if attrs[:enderDest]
          # Logradouro
          @address = attrs[:enderDest][:xLgr]
          # Numero
          @number = attrs[:enderDest][:nro]
          # Complemento
          @complement = attrs[:enderDest][:xCpl]
          # Bairro
          @neighborhood = attrs[:enderDest][:xBairro]
          # Código do município
          @city_code = attrs[:enderDest][:cMun]
          # Nome do município
          @city = attrs[:enderDest][:xMun]
          # Sigla da UF
          @state = attrs[:enderDest][:UF]
          # Código do CEP
          @zip_code = attrs[:enderDest][:CEP]
          # Codigo Pais
          @country_code = attrs[:enderDest][:cPais]
          # Nome do Pais
          @country = attrs[:enderDest][:xPais]
          # Telefone
          @phone = attrs[:enderDest][:fone]
        end
      end
    end
  end
end