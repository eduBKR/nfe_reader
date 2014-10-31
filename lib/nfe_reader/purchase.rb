# encoding: UTF-8
module NfeReader
  # Informações de Compras
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