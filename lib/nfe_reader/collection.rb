# encoding: UTF-8
module Nfe
  module Reader
    # Mapeia as Cobrancas
    class Collection
      include ::AttributeHelper

      attr_reader :number, :value, :descont, :value_net, :duplicates
      
      def initialize(attrs = {})
        if attrs[:fat]
          @number = attrs[:fat][:nFat]
          @value = attrs[:fat][:vOrig]
          @descont = attrs[:fat][:vDesc]
          @value_net = attrs[:fat][:vLiq]
        end

        @duplicates = set_duplicates(attrs[:dup])
      end
    
      def set_duplicates(attrs = {})
        duplicates = []
        
        return duplicates unless attrs

        if attrs.is_a? Array
          attrs.each do |d|
            duplicates << Duplicate.new(d)
          end
        else
           duplicates << Duplicate.new(attrs)
        end

        duplicates
      end
    end
  end
end