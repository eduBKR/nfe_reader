# encoding: UTF-8
module NfeReader
  class Total
    include AttributeHelper

    attr_reader :icms_base, :icms, :st_base, :st, :product, :freight,
      :insurance, :descount, :ii, :ipi, :pis, :cofins, :another, :total,
      :service_value, :service_base, :service_iss, :service_pis, :service_cofins,
      :retention_pis, :retention_csll, :retention_irrf_base, :retention_cofins,
      :retention_irrf, :retention_foresight_base, :retention_foresight, :tax

    def initialize(attrs = {})
      # Impostos
      if attrs[:ICMSTot]
        # Base ICMS
        @icms_base = attrs[:ICMSTot][:vBC]
        # Valor ICMS
        @icms = attrs[:ICMSTot][:vICMS]
        # Base ICMS ST
        @st_base = attrs[:ICMSTot][:vBCST]
        # Valor ICMS ST
        @st = attrs[:ICMSTot][:vST]
        # Total de Produtos
        @product = attrs[:ICMSTot][:vProd]
        # Total de Frete
        @freight = attrs[:ICMSTot][:vFrete]
        # Total de Seguro
        @insurance = attrs[:ICMSTot][:vSeg]
        # Total de Desconto
        @descount = attrs[:ICMSTot][:vDesc]
        # Total de Imposto de Importacao
        @ii = attrs[:ICMSTot][:vII]
        # Total de IPI
        @ipi = attrs[:ICMSTot][:vIPI]
        # Total de PIS
        @pis = attrs[:ICMSTot][:vPIS]
        # Total de COFINS
        @cofins = attrs[:ICMSTot][:vCOFINS]
        # Total de Outros
        @another = attrs[:ICMSTot][:vOutro]
        # Total NFe
        @total = attrs[:ICMSTot][:vNF]
        # Total NFe
        @tax = attrs[:ICMSTot][:vTotTrib]
      end

      # Servicos
      if attrs[:ISSQNtot]
        # Valor do Servico
        @service_value = attrs[:ISSQNtot][:vServ]
        # Base de calculo do Servico
        @service_base = attrs[:ISSQNtot][:vBC]
        # ISS do Servico
        @service_iss = attrs[:ISSQNtot][:vISS]
        # Pis do Servico
        @service_pis = attrs[:ISSQNtot][:vPIS]
        # Cofins do Servico
        @service_cofins = attrs[:ISSQNtot][:vCOFINS]
      end

      # Retencoes
      if attrs[:retTrib]
        # Retencao de PIS
        @retention_pis = attrs[:retTrib][:vRetPIS]
        # Retencao de COFINS
        @retention_cofins = attrs[:retTrib][:vRetCOFINS]
        # Retencao de CSLL
        @retention_csll = attrs[:retTrib][:vRetCSLL]
        # Base de Retencao do IRRF 
        @retention_irrf_base = attrs[:retTrib][:vBCIRRF]
        # Valor de Retencao do IRRF
        @retention_irrf = attrs[:retTrib][:vIRRF]
        # Base de Retencao da Previdencia
        @retention_foresight_base = attrs[:retTrib][:vBCRetPrev]
        # Valor de Retencao da Previdencia
        @retention_foresight = attrs[:retTrib][:vRetPrev]
      end
    end
  end
end