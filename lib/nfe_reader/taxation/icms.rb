# encoding: UTF-8
module Nfe
  class Icms
    attr_reader :origin, :cst, :icms_percentage, :icms, :icms_base_kind,
      :icms_base, :icms_base_reduction, :icms_st_base_kind, :icms_st_base_reduction,
      :mva, :icms_st_base, :icms_st_percentage, :icms_st, :icms_st_base_retained_sender,
      :icms_st_retained_sender, :icms_st_base_retained, :icms_st_retained, :state,
      :retained_reason, :credit_percentage, :icms_credit, :sn_operation_code
    
    # == Field Values
    #
    # ori: 0 - Nacional
    #      1 - Estrangeira - Importação direta
    #      2 - Estrangeira – Adquirida no mercado interno.
    #
    # modBC: 0 - Margem Valor Agregado (%);
    #        1 - Pauta (Valor);
    #        2 - Preço Tabelado Máx. (valor);
    #        3 - valor da operação.
    #
    # modBCST: 0 – Preço tabelado ou máximosugerido;
    #          1 - Lista Negativa (valor);
    #          2 - Lista Positiva (valor);
    #          3 - Lista Neutra (valor);
    #          4 - Margem Valor Agregado (%);
    #          5 - Pauta (valor);

    def initialize(attrs = {})
      # Origem da mercadoria
      @origin = attrs[:orig] 
      @origin ||= attrs[:Orig]
      
      # Tributação do ICMS
      @cst = attrs[:CST]
      
      # == ICMS
      #
      # % ICMS
      @icms_percentage = attrs[:pICMS]
      # Valor ICMS
      @icms = attrs[:vICMS]
      # Modalidade de determinação da BC do ICMS
      @icms_base_kind = attrs[:modBC]
      # Base ICMS
      @icms_base = attrs[:vBC]
      # % Redução Base ICMS
      @icms_base_reduction = attrs[:pRedBC]
      
      # == ICMS ST
      #
      # Modalidade de determinação da BC do ICMS ST
      @icms_st_base_kind = attrs[:modBCST]
      # % redução Base ICMS ST
      @icms_st_base_reduction = attrs[:pRedBCST]
      # MVA ST
      @mva = attrs[:pMVAST]
      # Base ICMS ST
      @icms_st_base = attrs[:vBCST]
      # % ICMS ST
      @icms_st_percentage = attrs[:pICMSST]
      # Valor ICMS ST
      @icms_st = attrs[:vICMSST]
      # Valor do BC do ICMS ST Retido UF Remetente
      @icms_st_base_retained_sender = attrs[:vBCSTRet]
      # Valor ICMS ST Retido UF Remetente
      @icms_st_retained_sender = attrs[:vICMSSTRet]
      # Valor do BC do ICMS ST Retido UF Destiantaria
      @icms_st_base_retained = attrs[:vBCSTDest]
      # Valor ICMS ST Retido UF Destinataria
      @icms_st_retained = attrs[:vICMSSTDes]
      # UF para qual é devido o ICMS ST
      @state = attrs[:UFST]
      
      # == Simples Nacional
      #
      # Motivo da desoneração do ICMS
      @retained_reason = attrs[:motDesICMS]
      # Alíquota aplicável de cálculo do crédito
      @credit_percentage = attrs[:pCredSN]
      # Valor crédito do ICMS que pode ser aproveitado nos termos do art. 23 da LC 123
      @icms_credit = attrs[:vCredICMSSN]
      # Código de Situação da Operação
      @sn_operation_code = attrs[:CSOSN]
    end
  end
end