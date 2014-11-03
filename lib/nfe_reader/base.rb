module NfeReader
  class Base
    def self.read(file)
      xml = file.is_a?(Nokogiri::XML::Document) ? file : Nokogiri::XML(file)
      
      if xml.at_css('enviNFe')
        NfeReader::Lot.new(xml.to_hash)
      else
        NfeReader::Nfe.new(xml.to_hash)
      end
    ensure
      file.close if file.respond_to? :close
    end
  end
end