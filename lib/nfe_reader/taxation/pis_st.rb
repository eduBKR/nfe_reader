# encoding: UTF-8
module Nfe
  class PisSt
    attr_reader :base, :percentage, :amount, :aliquot, :value
    
    def initialize(attrs = {})
      # Valor Base
      @base = attrs[:vBC]
      # % PISST
      @percentage = attrs[:pPIS]
      # Quantidade
      @amount = attrs[:qBCProd]
      # Aliquota PIS ST
      @aliquot = attrs[:vAliqProd]
      # Valor PIS ST
      @value = attrs[:vPIS]
    end
  end
end