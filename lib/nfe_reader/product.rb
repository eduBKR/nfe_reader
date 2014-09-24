# encoding: UTF-8
module Nfe
  # Detalhamento de Produtos e Serviços da NF-e
  class Product
    attr_reader :number, :product_code, :product, :ean, :ncm, :cfop,
      :unit_sale, :value_sale, :amount_sale, :total, :gtin, :unit,
      :amount, :value, :kind, :ipi_exception, :freight, :insurance,
      :discount, :other_value, :importation, :icms, :ipi, :pis,
      :importation_tax, :exportation, :demand_number, :demand_item,
      :armament, :fuel

    # == Fields Values
    #
    # indTot: 0 - o valor do item (vProd) compõe o valor total da NF-e (vProd)
    #         1 - o valor do item (vProd) não compõe o valor total da NF-e (vProd) (v2.0)
    #
    def initialize(attrs = {})
      @number = attrs[:nItem]
      
      if attrs[:prod]
        @product_code = attrs[:prod][:cProd]
        @product = attrs[:prod][:xProd]
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
        
        @importation = create_resource(Nfe::Importation, attrs[:prod][:DI])
      end

      @armament = create_resources(Nfe::Armament, attrs[:arma])    if attrs[:arma]
      @medicament = create_resources(Nfe::Medicament, attrs[:med]) if attrs[:med]
      @fuel = Nfe::Fuel.new(attrs[:comb]) if attrs[:comb]
      @vehicle = Nfe::Vehicle.new(attrs[:veicProd]) if attrs[:veicProd]

      @exportation = create_resources(Nfe::Exportation, attrs[:detExport])

      if attrs[:imposto]
        @icms = create_resources(Nfe::Icms, attrs[:imposto][:ICMS])
        @cofins = create_resources(Nfe::Cofins, attrs[:imposto][:COFINS])
        @pis = create_resources(Nfe::Pis, attrs[:imposto][:PIS])
        @importation_tax = create_resource(Nfe::ImportationTax, attrs[:imposto][:II])
        @ipi = create_resource(Nfe::Ipi, attrs[:imposto][:IPI])
        @pis_st = create_resource(Nfe::PisSt, attrs[:imposto][:PISST])
        @cofins_st = create_resource(Nfe::CofinsSt, attrs[:imposto][:COFINSST])
        @issqn = create_resource(Nfe::Issqn, attrs[:imposto][:ISSQN])
      end
    end

    def create_resource(klass, attrs = {})
      return unless attrs
      klass.new(attrs)
    end

    def create_resources(klass, attrs = {})
      resources = []

      return resources unless attrs

      attrs.each do |a|
        resources << klass.new(a.last)
      end

      resources
    end
  end
end