# encoding: UTF-8
module NfeReader
  # Documento Fiscal Referenciado
  class Document
    include AttributeHelper

    attr_reader :key, :nfe_state, :nfe_year, :nfe_cnpj, :nfe_model,
      :nfe_serie, :nfe_number, :farmer_state, :farmer_year, :farmer_cnpj,
      :farmer_cpf, :farmer_ie, :farmer_model, :farmer_serie, :farmer_number,
      :cte_key, :ecf_model, :ecf_number, :ecf_operation

    # == Fields Values
    # mod:
    #  refNF: 01 - modelo 01
    #  refNFP: 04 - NF de Produtor,
    #          01 - NF (v2.0)
    #  refECF: 2B - Cupom Fiscal emitido por máquina registradora (não ECF),
    #          2C - Cupom Fiscal PDV,
    #          2D - Cupom Fiscal (emitido por ECF) (v2.0)

    def initialize(attrs = {})
      # Chave da NF-e
      @key = attrs[:refNFe]

      # Referencia uma NF-e
      if attrs[:refNF]
        # Estado
        @nfe_state = attrs[:refNF][:cUF]
        # Ano e mes
        @nfe_year = attrs[:refNF][:AAMM]
        # CNPJ do emitente
        @nfe_cnpj = attrs[:refNF][:CNPJ]
        # Modelo do Documento Fiscal
        @nfe_model = attrs[:refNF][:mod]
        # Serie Documento Fiscal
        @nfe_serie = attrs[:refNF][:serie]
        # Numero Documento Fiscal
        @nfe_number = attrs[:refNF][:nNF]
      end

      # NF de Produtor Rural
      if attrs[:refNFP]
        # Estado
        @farmer_state = attrs[:refNFP][:cUF]
        # Ano e mes
        @farmer_year = attrs[:refNFP][:AAMM]
        # CNPJ do emitente
        @farmer_cnpj = attrs[:refNFP][:CNPJ]
        # CPF do emitente
        @farmer_cpf = attrs[:refNFP][:CPF]
        # IE do emitente
        @farmer_ie = attrs[:refNFP][:IE]
        # Modelo do Documento Fiscal
        @farmer_model = attrs[:refNFP][:mod]
        # Serie Documento Fiscal
        @farmer_serie = attrs[:refNFP][:serie]
        # Numero Documento Fiscal
        @farmer_number = attrs[:refNFP][:nNF]
      end

      # CT-e
      @cte_key = attrs[:refCTe]

      # Referencia uma ECF
      if attrs[:refECF]
        # Modelo do Documento Fiscal
        @ecf_model = attrs[:refECF][:mod]
        # Número de ordem sequencial do ECF
        @ecf_number = attrs[:refECF][:nECF]
        # Número do Contador de Ordem de Operação
        @ecf_operation = attrs[:refECF][:nCOO]
      end
    end
  end
end