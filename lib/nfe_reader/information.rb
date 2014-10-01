# encoding: UTF-8
module Nfe
  module Reader
    class Information
      include ::AttributeHelper
      include ::CreatorHelper

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
    end
  end
end