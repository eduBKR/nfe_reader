# encoding: UTF-8
module Nfe
  module Reader
    # Declaração de Importação
    class Importation
      include ::AttributeHelper

      attr_reader :number, :date, :local, :state, :customs_clearance, :exporter,
        :addition_number, :addition_sequence, :manufacturer, :addition_descount,
        :drawn, :transport, :afrmm, :intermediate_kind, :cnpj, :uf_customer

      def initialize(attrs = {})
        # Número do Documento de Importação
        @number = attrs[:nDI]
        # Data de Registro do documento
        @date = attrs[:dDI]
        # Local de desembaraço
        @local = attrs[:xLocDesemb]
        # Sigla da UF onde ocorreu o Desembaraço Aduaneiro
        @state = attrs[:UFDesemb]
        # Data do Desembaraço Aduaneiro
        @customs_clearance = attrs[:dDesemb]
        # Código do Exportador
        @exporter = attrs[:cExportador]

        # Via de transporte internacional
        @transport = attrs[:tpViaTransp]
        # Valor da AFRMM - Adicional ao Frete para Renovação da Marinha Mercante
        @afrmm = attrs[:vAFRMM]
        # Forma de importação
        @intermediate_kind = attrs[:tpIntermedio]
        # CNPJ do adquirente
        @cnpj = attrs[:CNPJ]
        # Sigla da UF
        @uf_customer = attrs[:UFTerceiro]

        # Adições
        if attrs[:adi]
          # Numero da Adição
          @addition_number = attrs[:adi][:nAdicaonSeqAdic]
          # Numero sequencial do item
          @addition_sequence = attrs[:adi][:nSeqAdic]
          # Código do fabricante estrangeiro
          @manufacturer = attrs[:adi][:cFabricante]
          # Valor do desconto do item
          @addition_descount = attrs[:adi][:vDescDI]
          # Drawback
          @drawn = attrs[:adi][:nDraw]
        end
      end
    end
  end
end