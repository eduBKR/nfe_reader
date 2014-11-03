module NfeReader
  class Lot
    include AttributeHelper
    include CreatorHelper

    attr_reader :version, :lot_version, :number, :nfes,
      :protocol

    def initialize(attrs)
      if attrs[:nfeProc]
        @version = attrs[:nfeProc][:versao]

        attrs = attrs[:nfeProc][:enviNFe]
      else
        attrs = attrs[:enviNFe]
      end

      @lot_version = attrs[:versao]
      @number = attrs[:idLote]

      @nfes = create_resources(Nfe, attrs)

      if attrs[:protNFe]
        @protocol = Protocol.new(attrs[:protNFe])
      end
    end

    def nfe?
      false
    end

    def lot?
      true
    end
  end
end