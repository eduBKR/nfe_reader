module AttributeHelper
  def attributes
    @attributes ||= attributes_to_hash
  end

  def attributes_to_hash
    attrs = Hash.new

    instance_variables.each do |var|
      key   = var.to_s.gsub /^@/, ''
      value = instance_variable_get(var)

      attrs[key] = value if [String, Hash].include? value.class
    end

    attrs
  end
end