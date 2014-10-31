# encoding: UTF-8
module NfeReader
  class Medicament
    include AttributeHelper

    attr_reader :lot_number, :lot_amount, :fabrication, :validity, :ceiling_price

    def initialize(attrs = {})
      # Numero de Lote
      @lot_number = attrs[:nLote]
      # Quantidade de Lotes
      @lot_amount = attrs[:qLote]
      # Data de Fabricação
      @fabrication = attrs[:dFab]
      # Data de Validade
      @validity = attrs[:dVal]
      # Preço maximo venda para Consumidor Final
      @ceiling_price = attrs[:vPMC]
    end
  end
end
