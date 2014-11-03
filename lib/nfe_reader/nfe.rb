module NfeReader
  class Nfe
    include AttributeHelper
    include CreatorHelper

    attr_reader :version, :number, :signature, :client, :information,
      :header, :provider, :customer, :products, :billing, :transport,
      :purchase, :cane, :export, :delivery, :removal, :total, 
      :authorizations, :error, :trace, :fiscal, :version_schema,
      :protocol

    def initialize(attrs)
      if attrs[:nfeProc]
        # Versao da NFe
        @version_schema = attrs[:nfeProc][:versao]
        # Assinatura
        @signature = attrs[:nfeProc][:NFe][:Signature]

        @protocol = Protocol.new(attrs[:nfeProc][:protNFe])

        attrs = attrs[:nfeProc][:NFe][:infNFe]
      else
        attrs = attrs[:NFe][:infNFe]
      end

      # Numero da Nfe
      @number = attrs[:Id]
      # Versao da NFe
      @version = attrs[:versao]

      # Identificação da Nota Fiscal eletrônica
      @header = Header.new(attrs[:ide])

      # Identificação do Emitente da Nota Fiscal eletrônica
      @provider = Provider.new(attrs[:emit])

      # Identificação do Fisco Emitente da NF-e
      if attrs[:avulsa]
        @fiscal = Fiscal.new(attrs[:avulsa])
      end

      # Identificação do Destinatário da Nota Fiscal eletrônica
      @customer = Customer.new(attrs[:dest])

      # Informacoes Adicional
      if attrs[:infAdic]
        @information = Information.new(attrs[:infAdic])
      end

      # Detalhamento de Produtos e Serviços da NF-e
      @products = create_resources(Product, attrs[:det])

      # Totalizadores
      @total = Total.new(attrs[:total])

      # Informacao de Pagamento
      if attrs[:cobr]
        @billing = Billing.new(attrs[:cobr])
      end

      # Transporte
      if attrs[:transp]
        @transport = Transport.new(attrs[:transp])
      end

      # Identificação do Local de Entrega
      if attrs[:retirada]
        @removal = Removal.new(attrs[:retirada])
      end

      # Identificação do Local de Retirada
      if attrs[:entrega]
        @delivery = Delivery.new(attrs[:entrega])
      end

      # Autorização para obter XML
      @authorizations = create_resources(Authorization, attrs[:autXML])

      # Informacoes de Comercio Exterior
      if attrs[:exporta]
        @export = Export.new(attrs[:exporta])
      end

      # Informacoes de Compra
      if attrs[:compra]
        @purchase = Purchase.new(attrs[:compra])
      end

      # Cana de Acucar
      if attrs[:cana]
        @cane = Cane.new(attrs[:cana])
      end

    rescue => exception
      @error = exception
      @trace = exception.backtrace
    end

    def nfe?
      true
    end

    def lot?
      false
    end

    def error?
      !error.nil?
    end
  end
end