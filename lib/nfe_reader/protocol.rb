module NfeReader
  class Protocol
    include AttributeHelper

    attr_reader :enviroment, :version_app, :key, :date,
      :number, :digest, :status, :description

    def initialize(attrs = {})
      attrs = attrs[:protNFe] ? attrs[:protNFe] : attrs

      if attrs[:infProt]
        # Ambiente
        @enviroment = attrs[:infProt][:tpAmb]
        # Versao do App Emissor
        @version_app = attrs[:infProt][:verAplic]
        # Chave
        @key = attrs[:infProt][:chNFe]
        # Data
        @date = attrs[:infProt][:dhRecbto]
        # Protocolo
        @number = attrs[:infProt][:nProt]
        @digest = attrs[:infProt][:digVal]
        @status = attrs[:infProt][:cStat]
        @description = attrs[:infProt][:xMotivo]
      end
    end
  end
end