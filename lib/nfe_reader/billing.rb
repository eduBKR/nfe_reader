# encoding: UTF-8
module Nfe
  module Reader
    # Mapeia as Cobrancas
    class Billing
      include ::AttributeHelper
      include CreatorHelper

      attr_reader :number, :value, :descont, :value_net, :duplicates
      
      def initialize(attrs = {})
        if attrs[:fat]
          @number = attrs[:fat][:nFat]
          @value = attrs[:fat][:vOrig]
          @descont = attrs[:fat][:vDesc]
          @value_net = attrs[:fat][:vLiq]
        end

        @duplicates = create_resources(Duplicate, attrs[:dup])
      end
    end
  end
end