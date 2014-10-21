# encoding: UTF-8
module Nfe
  module Reader
    class Cofins
      include AttributeHelper

      attr_reader :cst, :base, :percentage, :value, :amount,
        :aliquot

      # Fieds Values
      #
      # cst: 
      #   COFINSAliq:
      #     01 - Operação Tributável 
      #          (base de cálculo = valor da operação alíquota normal (cumulativo/não cumulativo));
      #     02 - Operação Tributável 
      #          (base de cálculo = valor da operação (alíquota diferenciada));
      #   COFINSQtde:
      #     03 - Operação Tributável 
      #          (base de cálculo = quantidade vendida x alíquota por unidadede produto);
      #   COFINSNT:
      #     04 - Operação Tributável
      #          (tributação monofásica(alíquota zero));
      #     06 - Operação Tributável(alíquota zero);
      #     07 - Operação Isenta da Contribuição;
      #     08 - Operação Sem Incidência da Contribuição;
      #     09 - Operação com Suspensão da Contribuição;
      #   COFINSOutr:
      #     99 - Outras Operações;
      #
      def initialize(attrs = {})
        # Cst COFINS
        @cst = attrs[:CST]
        # Base COFINS
        @base = attrs[:vBC]
        # % COFINS
        @percentage = attrs[:pCOFINS]
        # Valor COFINS
        @value = attrs[:vCOFINS]
        # Quantidade Vendida
        @amount = attrs[:qBCProd]
        # Alíquota do COFINS
        @aliquot = attrs[:vAliqProd]
      end
    end
  end
end