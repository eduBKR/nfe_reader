# encoding: UTF-8

# Informações de Compras
module Nfe
  module Reader
    class Purchase
      include AttributeHelper

      attr_reader :number, :demand, :contract

      def initialize(attrs = {})
        @number = attrs[:xNEmp]
        @demand = attrs[:xPed]
        @contract = attrs[:xCont]
      end
    end
  end
end