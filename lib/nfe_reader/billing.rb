# encoding: UTF-8
module NfeReader
  # Mapeia as Cobrancas
  class Billing
    include AttributeHelper
    include CreatorHelper

    attr_reader :number, :value, :descount, :value_net, :duplicates
    
    def initialize(attrs = {})
      if attrs[:fat]
        @number = attrs[:fat][:nFat]
        @value = attrs[:fat][:vOrig]
        @descount = attrs[:fat][:vDesc]
        @value_net = attrs[:fat][:vLiq]
      end

      @duplicates = create_resources(Duplicate, attrs[:dup])
    end
  end
end