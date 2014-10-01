# encoding: UTF-8
module Nfe
  module Reader
    class Transport
      include ::AttributeHelper

      attr_reader :kind, :service_value, :base, :icms_aliquot, :icms_value,
        :cfop, :city, :vehicle_plaque, :vehicle_state, :vehicle_rntc, :hauling_palque,
        :hauling_state, :hauling_rntc, :wagon, :ferry, :volume_amount, :volume_kind,
        :volume_brand, :volume_number, :weight_net, :weight_gross, :seals, :carrier

      # Fields Values:
      #
      # modFrete: 0- Por conta do emitente;
      #           1- Por conta do destinatário/remetente;
      #           2- Por conta de terceiros;
      #           9- Sem frete.
      # 
      def initialize(attrs = {})
        # Modalidade
        @kind = attrs[:modFrete]
        
        # == Grupo de Retenção do ICMS do transporte
        if attrs[:retTransp]
          # Valor do Servico
          @service_value = attrs[:retTransp][:vServ]
          # BC da Retenção do ICMS
          @base = attrs[:retTransp][:vBCRet]
          # Alíquota da Retenção
          @icms_aliquot = attrs[:retTransp][:pICMSRet]
          # Valor do ICMS Retido
          @icms_value = attrs[:retTransp][:vICMSRet]
          # CFOP
          @cfop = attrs[:retTransp][:CFOP]
          # Municipio gerador de ICMS
          @city = attrs[:retTransp][:cMunFG]
        end

        # == Veiculo
        if attrs[:veicTransp]
          # Placa
          @vehicle_plaque = attrs[:veicTransp][:placa]
          # Estado
          @vehicle_state = attrs[:veicTransp][:UF]
          # Registro Nacional de Transportador de Carga
          @vehicle_rntc = attrs[:veicTransp][:RNTC]
        end

        # == Reboque
        if attrs[:reboque]
          # Placa
          @hauling_palque = attrs[:reboque][:placa]
          # Estado
          @hauling_state = attrs[:reboque][:UF]
          # Registro Nacional de Transportador de Carga
          @hauling_rntc = attrs[:reboque][:RNTC]
        end

        # Vagao
        @wagon = attrs[:vagao]
        # Balsa
        @ferry = attrs[:balsa]
        
        # == Volume
        if attrs[:vol]
          # Quantidade de volumes
          @volume_amount = attrs[:vol][:qVol]
          # Espécie dos volumes
          @volume_kind = attrs[:vol][:esp]
          # Marca dos volumes
          @volume_brand = attrs[:vol][:marca]
          # Numeração dos volumes
          @volume_number = attrs[:vol][:nVol]
          # Peso Liquido
          @weight_net = attrs[:vol][:pesoL]
          # Peso Bruto
          @weight_gross = attrs[:vol][:pesoB]
          # Lacres
          @seals = set_seals(attrs[:vol][:lacres])
        end

        # Transportadora
        if attrs[:transporta]
          @carrier = Carrier.new(attrs[:transporta])
        end
      end

      def set_seals(attrs = {})
        return unless attrs

        if attrs.is_a? Array
          seals = attrs.map { |l| l[:nLacre] }.join(', ')
        else
          seals = attrs[:nLacre]
        end

        seals
      end
    end
  end
end