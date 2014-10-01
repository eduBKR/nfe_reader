# encoding: UTF-8
module Nfe
  module Reader
    # Identificação da Nota Fiscal eletrônica
    class Header
      include ::AttributeHelper

      attr_reader :state, :city, :sample_number, :operation, :number,
        :model, :emission, :emission_kind, :out, :out_time, :serie, :kind,
        :environment, :finality, :version, :payment, :process, :digit,
        :orientation, :emission_date, :destiny_code, :final_consumer,
        :consumer_presence, :contingency_date, :contingency_justification,
        :documents

      # == Fields Values
      #
      # cUF: 11-Rondônia, 12-Acre, 13-Amazonas, 14-Roraima, 15-Pará, 16-Amapá, 17-Tocantins,
      #      21-Maranhão, 22-Piauí, 23-Ceará, 24-Rio Grande do Norte, 25-Paraíba, 26-Pernambuco,
      #      27-Alagoas, 28-Sergipe, 29-Bahia, 31-Minas Gerais, 32-Espírito Santo, 33-Rio de Janeiro,
      #      35-São Paulo, 41-Paraná, 42-Santa Catarina, 3-Rio Grande do Sul, 50-Mato Grosso do Sul,
      #      51-Mato Grosso, 52-Goiás, 53-DistritoFederal
      #
      # mod: 55 - NF-e, 65 - NFC-e
      #
      # indPag: 0 - Vista, 1 - Prazo, 2 - Outros
      #
      # tpNF: 0 - Entrada, 1 - Saida
      #
      # tpAmb: 1 - Producao, 2 - Homologacao
      #
      # finNFe: 1 - Normal, 
      #         2 - Complementar, 
      #         3 - Ajuste,
      #         4 - Devolução/Retorno.
      #
      # tpEmis: 1 - Normal, 2 - Contingência FS, 3 - Contingência SCAN, 4 - Contingência FS-DA
      #
      # tpImp: 1 - Retrato, 
      #        2 - Paisagem,
      #        3 - DANFE Simplificado,
      #        4 - DANFE NFC-e,
      #        5 - DANFE NFC-e em mensagem eletrônica (o envio de
      #            mensagem eletrônica pode ser feita de forma simultânea
      #            com a impressão do DANFE; usar o tpImp=5 quando
      #            esta for a única forma de disponibilização do DANFE).
      #
      # procEmit:  0 - emissão de NF-e com aplicativo do contribuinte,
      #            1 - emissão de NF-e avulsa pelo Fisco,
      #            2 - emissão de NF-e avulsa, pelo site,
      #            3 - emissão NF-e pelo contribuinte com aplicativo fornecido pelo Fisco,
      #
      #  idDest: 1 - Operação interna,
      #          2 - Operação interestadual,
      #          3 - Operação com exterior
      #
      # indFinal: 0 - Não,
      #           1 - Consumidor final
      #
      # indPres: 0 - Não se aplica (por exemplo, Nota Fiscal complementar
      #              ou de ajuste);
      #          1 - Operação presencial;
      #          2 - Operação não presencial, pela Internet;
      #          3 - Operação não presencial, Teleatendimento;
      #          4 - NFC-e em operação com entrega a domicílio;
      #          9 - Operação não presencial, outros.

      def initialize(attrs = {})
        # Estado
        @state = attrs[:cUF]
        # Cidade
        @city = attrs[:cMunFG]
        # Numero Aleatorio
        @sample_number = attrs[:cNF]
        # Natureza Operacao
        @operation = attrs[:natOp]
        # Numero da Nota
        @number = attrs[:nNF]
        # Modelo
        @model = attrs[:mod]
        # Data Emissao
        @emission = attrs[:dEmi]
        # Tipo de Emissao
        @emission_kind = attrs[:tpEmis]
        # Data de Saida
        @out = attrs[:dSaiEnt]
        # Hora de Saida
        @out_time = attrs[:hSaiEnt]
        # Data de Emissao
        @emission_date = attrs[:dhEmi]
        # Serie
        @serie = attrs[:serie]
        # Tipo da Nota
        @kind = attrs[:tpNF]
        # Ambiente
        @environment = attrs[:tpAmb]
        # Finalidade
        @finality = attrs[:finNFe]
        # Versao aplicativo do emissor
        @version = attrs[:verProc]
        # Pagamento
        @payment = attrs[:indPag]
        # Processo de Emissao
        @process = attrs[:procEmi]
        # Digito Verificador
        @digit = attrs[:cDV]
        # Orientação da Pagina
        @orientation = attrs[:tpImp]
        # Codigo do Destino
        @destiny_code = attrs[:idDest]
        # Consumidor final
        @final_consumer = attrs[:indFinal]
        # Indicador de presença do comprador
        @consumer_presence = attrs[:indPres]

        # Contigencia
        @contingency_date = attrs[:dhCont]
        @contingency_justification = attrs[:xJust]

        # Documento Fiscal Referenciado
        @documents = []

        if attrs[:NFref].is_a? Array
          attrs[:NFref].each do |document|
            @documents << Document.new(document)
          end
        elsif attrs[:NFref].is_a? Hash
          @documents << Document.new(attrs[:NFref])
        end
      end
    end
  end
end