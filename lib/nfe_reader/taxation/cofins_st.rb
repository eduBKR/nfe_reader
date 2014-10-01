# encoding: UTF-8
module Nfe
  module Reader
    class CofinsSt
      include ::AttributeHelper

      attr_reader :base, :percentage, :amount, :aliquot, :value

      def initialize(attrs = {})
        # Valor Base
        @base = attrs[:vBC]
        # % COFINS ST
        @percentage = attrs[:pCOFINS]
        # Quantidade
        @amount = attrs[:qBCProd]
        # Aliquota COFINS ST
        @aliquot = attrs[:vAliqProd]
        # Valor COFINS ST
        @value = attrs[:vCOFINS]
      end
    end
  end
end