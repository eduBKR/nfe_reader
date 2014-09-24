require File.expand_path("../test_helper", __FILE__)

describe Nokogiri::XML::Node do
  def xml
    %q{
      <xml>
        <tag_one version='1.0'>
          <subtag_one>Subtag One</subtag_one>
        </tag_one>
        <tag_two>Tag Two</tag_two>
        <empty_tag/>
      </xml>
    }
  end

  def xml_in_hash
    {:xml=>{:tag_one=>{:version=>"1.0", :subtag_one=>"Subtag One"}, :tag_two=>"Tag Two", :empty_tag=> nil}}
  end

  let(:nokogiri_xml) { Nokogiri::XML(xml) }

  it { assert_equal nokogiri_xml.to_hash, xml_in_hash }
  it { assert_equal nokogiri_xml.to_hash[:xml][:tag_one][:version], "1.0" }
  it { assert_equal nokogiri_xml.to_hash[:xml][:tag_one][:subtag_one], "Subtag One" }
  it { assert_equal nokogiri_xml.to_hash[:xml][:tag_two], "Tag Two" }
  it { assert_equal nokogiri_xml.to_hash[:xml][:empty_tag], nil }
end