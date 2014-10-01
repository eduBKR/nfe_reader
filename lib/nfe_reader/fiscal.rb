# encoding: UTF-8
module Nfe
  module Reader
    # Identificação do Fisco Emitente da NF-e
    class Fiscal
      include ::AttributeHelper

      attr_reader :cnpj, :agency, :code, :name, :paid_date,
         :phone, :state, :number, :date, :value, :repartition

      def initialize(attrs = {})
        # CNPJ emitente
        @cnpj = attrs[:CNPJ]
        # Órgão emitente
        @agency = attrs[:xOrgao]
        # Matrícula do agente do Fisco
        @code = attrs[:matr]
        # Nome do agente do Fisco
        @name = attrs[:xAgente]
        # Telefone do agente do Fisco
        @phone = attrs[:fone]
        # Estado
        @state = attrs[:UF]
        # Número do DAR(Documento de Arrecadação de Receita)
        @number = attrs[:nDAR]
        # Data
        @date = attrs[:dEmi]
        # Valor do DAR
        @value = attrs[:vDAR]
        # Repartição Fiscal emitente
        @repartition = attrs[:repEmi]
        # Data do Pagamento
        @paid_date = attrs[:dPag]
      end
    end
  end
end