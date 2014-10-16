module Nfe
  module Reader
    class Person
      include AttributeHelper

      attr_reader :cnpj, :cpf, :state_registration,
        :name, :phone, :suframa, :email, :fantasy,
        :state, :rntrc, :owner_kind, :state_registration_st,
        :city_registration, :regime, :cnae, :foreign_code,
        :state_registration_code

      # == Fields Values
      #
      # CRT: 1 - Simples Nacional,
      #      2 - Simples Nacional – excesso de sublimite de receita bruta,
      #      3 - Regime Normal
      #
      def initialize(attrs = {})
        # CNPJ
        @cnpj = attrs[:CNPJ]
        # CPF
        @cpf = attrs[:CPF]
        # Inscricao Estadual
        @state_registration = attrs[:IE]
        # Inscricao Estadual ST
        @state_registration_st = attrs[:IEST]
        # Codigo Inscricao Estadual
        @state_registration_code = attrs[:indIEDest]
        # Incsricao municipal
        @city_registration = attrs[:IM]
        # Nome
        @name = attrs[:xNome]
        # Fantasia Empresa
        @fantasy = attrs[:xFant]
        # Telefone
        @phone = attrs[:fone]
        # Incricao Suframa
        @suframa = attrs[:ISUF]
        # Email
        @email = attrs[:email]
        # Estado
        @state = attrs[:UF]
        # Regime
        @regime = attrs[:CRT]
        # CNAE
        @cnae = attrs[:CNAE]
        # Identificação do destinatário no caso de comprador estrangeiro
        @foreign_code = attrs[:idEstrangeiro]
        # Proprietario do Veiculo
        @rntrc = attrs[:RNTRC]
        @owner_kind = attrs[:tpProp]
      end
    end
  end
end