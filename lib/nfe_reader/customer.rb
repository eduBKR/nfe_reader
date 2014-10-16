# encoding: UTF-8
module Nfe
  module Reader
    # Identificação do Destinatário da Nota Fiscal eletrônica
    class Customer
      include ::AttributeHelper

      attr_reader :person, :address

      # == Fields Values
      #
      # indIEDest: 1 - Contribuinte ICMS (informar a IE do destinatário),
      #            2 - Contribuinte isento de Inscrição no cadastro de Contribuintes do ICMS,
      #            9 - Não Contribuinte, que pode ou não possuir Inscrição Estadual

      def initialize(attrs = {})
        @person = Person.new(attrs)

        # Address
        if attrs[:enderDest]
          @address = Address.new(attrs[:enderDest])
        end
      end
    end
  end
end