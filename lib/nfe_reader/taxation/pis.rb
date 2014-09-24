# encoding: UTF-8
module Nfe
  class Pis
    attr_reader :cst, :base, :percentage, :value, :amount, :aliquot
    
    # Fieds Values
    #
    # cst: 
    #   PISAliq:
    #     01 - Operação Tributável 
    #          (base de cálculo = valor da operação alíquota normal (cumulativo/não cumulativo));
    #     02 - Operação Tributável 
    #          (base de cálculo = valor da operação (alíquota diferenciada));
    #   PISQtde:
    #     03 - Operação Tributável 
    #          (base de cálculo = quantidade vendida x alíquota por unidadede produto);
    #   PISNT:
    #     04 - Operação Tributável
    #          (tributação monofásica(alíquota zero));
    #     06 - Operação Tributável(alíquota zero);
    #     07 - Operação Isenta da Contribuição;
    #     08 - Operação Sem Incidência da Contribuição;
    #     09 - Operação com Suspensão da Contribuição;
    #   PISOutr:
    #     99 - Outras Operações;
    #
    def initialize(attrs = {})
      # Cst PIS
      @cst = attrs[:CST]
      # Base PIS
      @base = attrs[:vBC]
      # % PIS
      @percentage = attrs[:pPIS]
      # Valor PIS
      @value = attrs[:vPIS]
      # Quantidade Vendida
      @amount = attrs[:qBCProd]
      # Alíquota do PIS
      @aliquot = attrs[:vAliqProd]
    end
  end
end