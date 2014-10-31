module NfeReader
  module CreatorHelper
    def create_resource(klass, attrs = {})
      return unless attrs
      klass.new(attrs)
    end

    def create_resources(klass, attrs = {})
      resources = []

      return resources unless attrs

      if attrs.is_a? Hash
        resources << klass.new(attrs)
      else
        attrs.each do |a|
          resources << klass.new(a)
        end
      end

      resources
    end

    def to_array(attrs = {})
      array = []

      return [] unless attrs

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