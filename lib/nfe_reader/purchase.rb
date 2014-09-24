# encoding: UTF-8

# Informações de Compras
module Nfe
  class Purchase
    attr_reader :number, :demand, :contract

    def initialize(attrs = {})
      @number = attrs[:xNEmp]
      @demand = attrs[:xPed]
      @contract = attrs[:xCont]
    end
  end
end