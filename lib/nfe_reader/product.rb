# encoding: UTF-8
module Nfe
  module Reader
    # Detalhamento de Produtos e Serviços da NF-e
    class Product
      include AttributeHelper
      include CreatorHelper

      attr_reader :number, :code, :name, :ean, :ncm, :cfop,
        :unit_sale, :value_sale, :amount_sale, :total, :gtin, :unit,
        :amount, :value, :kind, :ipi_exception, :freight, :insurance,
        :discount, :other_value, :importation, :icms, :ipi, :pis,
        :importation_tax, :exportation, :demand_number, :demand_item,
        :armament, :fuel, :vehicle, :medicament, :cofins, :pis_st,
        :cofins_st, :issqn

      # == Fields Values
      #
      # indTot: 0 - o valor do item (vProd) compõe o valor total da NF-e (vProd)
      #         1 - o valor do item (vProd) não compõe o valor total da NF-e (vProd) (v2.0)
      #
      def initialize(attrs = {})
        @number = attrs[:nItem]
        
        if attrs[:prod]
          @code = attrs[:prod][:cProd]
          @name = attrs[:prod][:xProd]
          @ean = attrs[:prod][:cEAN]
          @ncm = attrs[:prod][:NCM]
          
          # Sale
          @cfop = attrs[:prod][:CFOP]
          @unit_sale = attrs[:prod][:uCom]
          @amount_sale = attrs[:prod][:qCom]
          @value_sale = attrs[:prod][:vUnCom]
          @total = attrs[:prod][:vProd]

          # Numero do Pedido de Compra
          @demand_number = attrs[:prod][:xPed]
          # Item do Pedido de Compra
          @demand_item = attrs[:prod][:nItemPed]

          # GTIN (Global Trade ItemNumber)
          @gtin = attrs[:prod][:cEANTrib]
          
          @unit = attrs[:prod][:uTrib]
          @amount = attrs[:prod][:qTrib]
          @value = attrs[:prod][:vUnTrib]
          @kind = attrs[:prod][:indTot]
          @ipi_exception = attrs[:prod][:EXTIPI]
          @freight = attrs[:prod][:vFrete]
          @insurance = attrs[:prod][:vSeg]
          @discount = attrs[:prod][:vDesc]
          @other_value = attrs[:prod][:vOutro]
          
          @importation = create_resource(Importation, attrs[:prod][:DI])
        end

        @fuel    = Fuel.new(attrs[:comb]) if attrs[:comb]
        @vehicle = Vehicle.new(attrs[:veicProd]) if attrs[:veicProd]
        
        @armament   = create_resources(Armament, attrs[:arma])  if attrs[:arma]
        @medicament = create_resources(Medicament, attrs[:med]) if attrs[:med]

        @exportation = create_resources(Exportation, attrs[:detExport])

        if attrs[:imposto]
          @icms   = create_resources(Icms, attrs[:imposto][:ICMS])
          @cofins = create_resources(Cofins, attrs[:imposto][:COFINS])
          @pis    = create_resources(Pis, attrs[:imposto][:PIS])
          
          @importation_tax = create_resource(ImportationTax, attrs[:imposto][:II])
          @ipi = create_resource(Ipi, attrs[:imposto][:IPI])
          @pis_st = create_resource(PisSt, attrs[:imposto][:PISST])
          @cofins_st = create_resource(CofinsSt, attrs[:imposto][:COFINSST])
          @issqn = create_resource(Issqn, attrs[:imposto][:ISSQN])
        end
      end
    end
  end
end