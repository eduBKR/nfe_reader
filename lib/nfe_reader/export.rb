# encoding: UTF-8
module NfeReader
  # Informações de Comércio Exterior
  class Export
    include AttributeHelper

    attr_reader :state, :address

    def initialize(attrs = {})
      @state = attrs[:UFEmbarq]
      @address = attrs[:xLocEmbarq]
    end
  end
end