# encoding: UTF-8
module Nfe
  module Reader
    # Identificação do Emitente da Nota Fiscal eletrônica
    class Provider
      attr_reader :person, :address

      def initialize(attrs = {})
        # Person
        @person = Person.new(attrs)

        # Address
        if attrs[:enderEmit]
          @address = Address.new(attrs[:enderEmit])
        end
      end
    end
  end
end