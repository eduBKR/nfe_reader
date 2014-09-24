# encoding: UTF-8
# Informações de Comércio Exterior
module Nfe
  class Export
    attr_reader :state, :address

    def initialize(attrs = {})
      @state = attrs[:UFEmbarq]
      @address = attrs[:xLocEmbarq]
    end
  end
end