# encoding: UTF-8
require "nfe_reader/version"
require "nokogiri"
require "nokogiri_hash"

%w(nfe_reader/product nfe_reader/collection nfe_reader/taxation nfe_reader).each do |namespace|
  Dir[File.dirname(__FILE__) + "/../lib/#{namespace}/*.rb"].each { |file| require file }
end

module Nfe
  module Reader
    class Base
      attr_reader :version, :number, :signature, :client, :information,
        :header, :provider, :customer, :products, :collection, :transport,
        :purchase, :cane, :export, :delivery, :removal,:enviroment,
        :version_app, :key, :date, :protocol, :digest, :status, :description,
        :total, :authorizations, :error, :trace

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
        @header = Nfe::Header.new(xml[:ide])

        # Identificação do Emitente da Nota Fiscal eletrônica
        @provider = Nfe::Provider.new(xml[:emit])

        # Identificação do Fisco Emitente da NF-e
        if xml[:avulsa]
          @fiscal = Nfe::Fiscal.new(xml[:avulsa])
        end

        # Identificação do Destinatário da Nota Fiscal eletrônica
        @customer = Nfe::Customer.new(xml[:dest])

        # Informacoes Adicional
        if xml[:infAdic]
          @information = Nfe::Information.new(xml[:infAdic])
        end

        # Detalhamento de Produtos e Serviços da NF-e
        @products = []
        if xml[:det].is_a? Array
          xml[:det].each do |product|
            @products << Nfe::Product.new(product)
          end
        else
          @products << Nfe::Product.new(xml[:det])
        end

        # Totalizadores
        @total = Nfe::Total.new(xml[:total])

        # Informacao de Pagamento
        if xml[:cobr]
          @collection = Nfe::Collection.new(xml[:cobr])
        end

        # Transporte
        if xml[:transp]
          @transport = Nfe::Transport.new(xml[:transp])
        end

        # Identificação do Local de Entrega
        if xml[:retirada]
          @removal = Nfe::Removal.new(xml[:retirada])
        end

        # Identificação do Local de Retirada
        if xml[:entrega]
          @delivery = Nfe::Delivery.new(xml[:entrega])
        end

        # Autorização para obter XML
        @authorizations = []
        if xml[:autXML].is_a? Array
          xml[:autXML].each do |product|
            @authorizations << Nfe::Authorization.new(product)
          end
        elsif xml[:autXML].is_a? Hash
          @authorizations << Nfe::Authorization.new(xml[:autXML])
        end

        # Informacoes de Comercio Exterior
        if xml[:exporta]
          @export = Nfe::Export.new(xml[:exporta])
        end

        # Informacoes de Compra
        if xml[:compra]
          @purchase = Nfe::Purchase.new(xml[:compra])
        end

        # Cana de Acucar
        if xml[:cana]
          @cane = Nfe::Cane.new(xml[:cana])
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