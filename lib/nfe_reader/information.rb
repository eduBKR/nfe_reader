# encoding: UTF-8
module Nfe
  class Information
    attr_reader :information, :information_taxpayer, :taxpayer_messages, :messages,
      :references

    def initialize(attrs = {})
      @information = attrs[:infAdFisco]
      @information_taxpayer = attrs[:infCpl]

      if attrs[:procRef]
        @references = to_array(attrs[:procRef])
      end

      if attrs[:obsCont]
        @taxpayer_messages = to_array(attrs[:obsCont])
      end

      if attrs[:obsFisco]
        @messages = to_array(attrs[:obsFisco])
      end
    end

    def to_array(attrs = {})
      array = []

      if attrs.is_a? Array
        attrs.each do |hash|
          array << hash.map { |key, value| value }
        end
      else
        array << attrs.map { |key, value| value }
      end

      array
    end
  end
end