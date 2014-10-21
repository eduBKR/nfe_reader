# encoding: UTF-8
# Informações de Comércio Exterior
module Nfe
  module Reader
    class Export
      include AttributeHelper

      attr_reader :state, :address

      def initialize(attrs = {})
        @state = attrs[:UFEmbarq]
        @address = attrs[:xLocEmbarq]
      end
    end
  end
end