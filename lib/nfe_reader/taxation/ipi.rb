# encoding: UTF-8
module Nfe
  module Reader
    class Ipi
      include AttributeHelper

      attr_reader :frame_class, :frame_code, :cnpj, :seal, :seal_amount,
        :cst, :ipi_base, :amount, :value_unit, :percentage, :value, :cst_group

      def initialize(attrs = {})
        # Classe de enquadramento do IPI para Cigarros e Bebidas
        @frame_class = attrs[:clEnq]
        # Codigo enquadramento
        @frame_code = attrs[:cEnq]
        # CNPJ do produtor
        @cnpj = attrs[:CNPJProd]
        # Código do selo de controle
        @seal = attrs[:cSelo]
        # Quantidade do selo de controle
        @seal_amount = attrs[:qSelo]
        
        # == Tributação
        if attrs[:IPITrib]
          # Código da situação tributária do IPI
          @cst = attrs[:IPITrib][:CST]
          # Valor da BC do IPI
          @ipi_base = attrs[:IPITrib][:vBC]
          # Quantidade total na unidade padrão para tributação
          @amount = attrs[:IPITrib][:qUnid]
          # Valor por Unidade Tributável
          @value_unit = attrs[:IPITrib][:vUnid]
          # % do IPI
          @percentage = attrs[:IPITrib][:pIPI]
          # Valor do IPI
          @value = attrs[:IPITrib][:vIPI]
        end

        if attrs[:IPINT]
          # Grupo do CST 01, 02, 03, 04, 51, 52, 53, 54 e 55
          @cst_group = attrs[:IPINT][:CST]
        end
      end
    end
  end
end