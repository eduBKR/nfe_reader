module NfeReader
  module AttributeHelper
    def attributes
      @attributes ||= attributes_to_hash
    end

    WITHELIST = %w(taxpayer_messages messages seals)

    def attributes_to_hash
      attrs = Hash.new

      instance_variables.each do |var|
        key   = var.to_s.gsub /^@/, ''
        value = instance_variable_get(var)

        if [String, Hash].include?(value.class) || WITHELIST.include?(key)
          attrs[key] = value
        end
      end

      attrs
    end
  end
end