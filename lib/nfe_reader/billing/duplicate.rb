# encoding: UTF-8
module NfeReader
  class Duplicate
    include AttributeHelper

    attr_reader :number, :expiration, :value

    def initialize(attrs = {})
      @number = attrs[:nDup]
      @expiration = attrs[:dVenc]
      @value = attrs[:vDup]
    end
  end
end