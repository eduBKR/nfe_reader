# encoding: UTF-8
module Nfe
  class Issqn
    attr_accessor :base, :aliquot, :value, :city, :services, :cst

    # Fields Values
    #
    # cStiTrib : N - NORMAL;
    #            R - RETIDA;
    #            S - SUBSTITUTA;
    #            I - ISENTA

    def initialize(attrs = {})
      @base = attrs[:vBC]
      @aliquot = attrs[:vAliq]
      @value = attrs[:vISSQN]
      @city = attrs[:cMunFG]
      @services = attrs[:cListServ]
      @cst = attrs[:cSitTrib]
    end
  end
end