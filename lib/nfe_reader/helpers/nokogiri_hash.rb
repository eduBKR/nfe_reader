class Nokogiri::XML::Node
  def to_hash
    return { root.name.to_sym => root.collect_nodes }
  rescue Exception => e
    { :error => e.to_s }
  end
  
  def collect_nodes(result_hash = {})
    if element?
      hash_attributes = attributes_in_hash
      hash_children = children_in_hash

      if hash_attributes != {}
        result_hash = hash_attributes.merge(hash_children)
      else
        result_hash = hash_children
      end

      result_hash
    else
      content.to_s
    end 
  end
  
  def attributes_in_hash(node_attributes = {})
    attributes.keys.each do |key|
      name = attributes[key].name.to_sym
      node_attributes[name] = attributes[key].value
    end

    node_attributes
  end

  def children_in_hash(result_hash = {})
    children.each do |child|
      result = child.collect_nodes
      name = child.name.to_sym

      if child.name == "text"
        unless child.next_sibling || child.previous_sibling
          return result
        end
      elsif child.cdata?
        return child.text
      elsif result_hash[name]
        if result_hash[name].is_a?(Object::Array)
          result_hash[name] << result
        else
          result_hash[name] = [result_hash[name]] << result
        end
      else
        if result.class == Hash && result.empty?
          result_hash[name] = nil
        else
          result_hash[name] = result
        end
      end
    end

    result_hash
  end
end