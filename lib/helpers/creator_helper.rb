module CreatorHelper
  def create_resource(klass, attrs = {})
    return unless attrs
    klass.new(attrs)
  end

  def create_resources(klass, attrs = {})
    resources = []

    return resources unless attrs

    attrs.each do |a|
      resources << klass.new(a.last)
    end

    resources
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