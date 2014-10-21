module Nfe
  module Reader
    class Nfe
      include AttributeHelper
      include CreatorHelper

      attr_reader :version, :number, :signature, :client, :information,
        :header, :provider, :customer, :products, :billing, :transport,
        :purchase, :cane, :export, :delivery, :removal,:enviroment,
        :version_app, :key, :date, :protocol, :digest, :status, :description,
        :total, :authorizations, :error, :trace, :fiscal

      def initialize(file)

        xml = file.is_a?(Nokogiri::XML::Document) ? file : Nokogiri::XML(file)
        xml = xml.to_hash

        # Versao da NFe
        @version = xml[:nfeProc][:versao]
        # Assinatura
        @signature = xml[:nfeProc][:NFe][:Signature]

        # Protocolo
        if xml[:nfeProc][:protNFe]
          protocol = xml[:nfeProc][:protNFe][:infProt]

          @enviroment = protocol[:tpAmb]
          @version_app = protocol[:verAplic]
          @key = protocol[:chNFe]
          @date = protocol[:dhRecbto]
          @protocol = protocol[:nProt]
          @digest = protocol[:digVal]
          @status = protocol[:cStat]
          @description = protocol[:xMotivo]
        end

        xml = xml[:nfeProc][:NFe][:infNFe]

        # Numero da Nfe
        @number = xml[:Id]

        # Identificação da Nota Fiscal eletrônica
        @header = Header.new(xml[:ide])

        # Identificação do Emitente da Nota Fiscal eletrônica
        @provider = Provider.new(xml[:emit])

        # Identificação do Fisco Emitente da NF-e
        if xml[:avulsa]
          @fiscal = Fiscal.new(xml[:avulsa])
        end

        # Identificação do Destinatário da Nota Fiscal eletrônica
        @customer = Customer.new(xml[:dest])

        # Informacoes Adicional
        if xml[:infAdic]
          @information = Information.new(xml[:infAdic])
        end

        # Detalhamento de Produtos e Serviços da NF-e
        @products = create_resources(Product, xml[:det])

        # Totalizadores
        @total = Total.new(xml[:total])

        # Informacao de Pagamento
        if xml[:cobr]
          @billing = Billing.new(xml[:cobr])
        end

        # Transporte
        if xml[:transp]
          @transport = Transport.new(xml[:transp])
        end

        # Identificação do Local de Entrega
        if xml[:retirada]
          @removal = Removal.new(xml[:retirada])
        end

        # Identificação do Local de Retirada
        if xml[:entrega]
          @delivery = Delivery.new(xml[:entrega])
        end

        # Autorização para obter XML
        @authorizations = create_resources(Authorization, xml[:autXML])

        # Informacoes de Comercio Exterior
        if xml[:exporta]
          @export = Export.new(xml[:exporta])
        end

        # Informacoes de Compra
        if xml[:compra]
          @purchase = Purchase.new(xml[:compra])
        end

        # Cana de Acucar
        if xml[:cana]
          @cane = Cane.new(xml[:cana])
        end

      rescue => exception
        @error = exception
        @trace = exception.backtrace
      ensure
        file.close if file.respond_to? :close
      end

      def error?
        !error.nil?
      end
    end
  end
end