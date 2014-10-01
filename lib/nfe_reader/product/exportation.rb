# encoding: UTF-8
module Nfe
  module Reader
    class Exportation
      include ::AttributeHelper

      attr_reader :drawnback, :number, :key, :amount

      def initialize(attrs = {})
        # Número do ato concessório de Drawback
        @drawnback = attrs[:nDraw]
        
        if attrs[:exportInd]
          # Número do Registro de Exportação
          @number = attrs[:exportInd][:nRE]
          # Chave de Acesso da NF-e recebida para exportação
          @key = attrs[:exportInd][:chNFe]
          # Quantidade do item realmente exportado
          @amount= attrs[:exportInd][:qExport]
        end
      end
    end
  end
end