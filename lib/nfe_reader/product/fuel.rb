# encoding: UTF-8
module Nfe
  class Fuel
    attr_reader :anp, :codif, :amount, :cide_base, :cide_aliquot, :cide_value

    def initialize(attrs = {})
      @anp = attrs[:cProdANP]
      @codif = attrs[:CODIF]
      @amount = attrs[:qTemp]
      
      if attrs[:CIDE]
        @cide_base = attrs[:CIDE][:qBCprod]
        @cide_aliquot = attrs[:CIDE][:vAliqProd]
        @cide_value = attrs[:CIDE][:vCIDE]
      end
    end
  end
end