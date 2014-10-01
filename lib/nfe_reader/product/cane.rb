module Nfe
  module Reader
    class Cane
      include ::AttributeHelper
      include ::CreatorHelper

      attr_reader :harvest, :month, :month_amount, :previous_amount, :amount,
        :value, :deduction_value, :net_value, :days, :deductions

      def initialize(attrs = {})
        @harvest = attrs[:safra]
        @month = attrs[:ref]
        @month_amount = attrs[:qTotMes]
        @previous_amount = attrs[:qTotAnt]
        @amount = attrs[:qTotGer]
        @value = attrs[:vFor]
        @deduction_value = attrs[:vTotDed]
        @net_value = attrs[:vLiqFor]

        @days = []
        
        if attrs[:forDia]
          @days = to_array(attrs[:forDia])
        end

        if attrs[:deduc]
          @deductions = to_array(attrs[:deduc])
        end
      end
    end
  end
end