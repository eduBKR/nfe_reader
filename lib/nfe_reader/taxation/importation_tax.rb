# encoding: UTF-8
module Nfe
  class ImportationTax
    attr_reader :base, :expenditure, :taxes, :iof
    
    def initialize(attrs = {})
      # Base de Caluclo
      @base = attrs[:vBC]
      # Despesas Aduaneiras
      @expenditure = attrs[:vDespAdu]
      # Imposto de Importação
      @taxes = attrs[:vII]
      # IOF
      @iof = attrs[:vIOF]
    end
  end
end