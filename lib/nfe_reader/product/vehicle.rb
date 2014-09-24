# encoding: UTF-8
module Nfe
  class Vehicle
    attr_reader :operation, :chassi, :color, :color_name, :engine_power,
      :engine_capacities, :weight_net, :weight_gross, :serie, :fuel_kind,
      :engine_number, :cmt, :wheelbase, :year, :fabrication_year, 
      :paint_kind, :kind, :vehicle_kind, :vin, :condiction, :model,
      :color_code, :capacity, :restriction

    # Fields Values
    #
    # pOp: 1 - Venda concessionária,
    #      2 - Faturamento direto para consumidor final
    #      3 - Venda direta para grandes consumidores (frotista, governo, ...)
    #      0 - Outros
    #
    # tpComb: 01-Álcool
    #         02-Gasolina
    #         03-Diesel
    #         (...) - Tabela Renavam 2.0
    #
    # tpVeic: Utilizar Tabela RENAVAM
    #         06-AUTOMÓVEL
    #         14-CAMINHÃO
    #         13-CAMINHONETA
    #         ...
    #
    # espVeic: Utilizar Tabela RENAVAM
    #          1 - PASSAGEIRO
    #          2 - CARGA
    #          3 - MISTO
    #          4 - CORRIDA
    #          5 - TRAÇÃO
    #          6 - ESPECIAL
    #
    # VIN: R - Remarcado
    #      N - Normal
    #
    # condVeic: 1 - Acabado;
    #           2 - Inacabado;
    #           3 - Semi-acabado
    #
    # cCorDEN: 01 - AMARELO
    #          02 - AZUL
    #          03 - BEGE
    #          04 - BRANCA
    #          05 - CINZA
    #          06 - DOURADA
    #          07 - GRENA
    #          08 - LARANJA
    #          09 - MARROM
    #          10 - PRATA
    #          11 - PRETA
    #          12 - ROSA
    #          13 - ROXA
    #          14 - VERDE
    #          15 - VERMELHA
    #          16 - FANTASIA
    #
    # tpRest: 0 - Não há;
    #         1 - Alienação Fiduciária;
    #         2 - Arrendamento Mercantil;
    #         3 - Reserva de Domínio;
    #         4 - Penhor de Veículos;
    #
    def initialize(attrs = {})
      # Tipo da operação
      @operation = attrs[:pOp]
      # Numero do Chassi
      @chassi = attrs[:chassi]
      # Cor do Fabricante
      @color = attrs[:cCor]
      # Nome da Cor do Fabricante
      @color_name = attrs[:xCor]
      # Potencia do Motor em CV
      @engine_power = attrs[:pot]
      # Potencia do Motor em CC
      @engine_capacities = attrs[:cilin]
      # Peso Liquido
      @weight_net = attrs[:pesoL]
      # Peso Bruto
      @weight_gross = attrs[:pesoB]
      # Numero serie
      @serie = attrs[:nSerie]
      # Tipo de Combustivel
      @fuel_kind = attrs[:tpComb]
      # Numeracao do Motor
      @engine_number = attrs[:nMotor]
      # CMT: Capacidade Maxima de Tração
      @cmt = attrs[:CMT]
      # Distancia entre os Eixos
      @wheelbase = attrs[:dist]
      # Ano do Modelo
      @year = attrs[:anoMod]
      # Ano de Fabricacao
      @fabrication_year = attrs[:anoFab]
      # Tipo de Pintura
      @paint_kind = attrs[:tpPint]
      # Tipo de Veiculo
      @kind = attrs[:tpVeic]
      # Especie do veiculo
      @vehicle_kind = attrs[:espVeic]
      # Condição do VIN
      @vin = attrs[:VIN]
      # Condições do Veiculo
      @condiction = attrs[:condVeic]
      # Modelo
      @model = attrs[:cMod]
      # Codigo da Cor
      @color_code = attrs[:cCorDEN]
      # Capacidade
      @capacity = attrs[:lota]
      # Restrição
      @restriction = attrs[:tpRest]
    end
  end
end