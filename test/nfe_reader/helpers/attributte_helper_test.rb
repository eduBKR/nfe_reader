require File.expand_path("../../../test_helper", __FILE__)

describe NfeReader::AttributeHelper do
  class AttributeTest
    include NfeReader::AttributeHelper
    attr_accessor :first_name, :last_name

    def initialize( attrs= {})
      @first_name = attrs[:first_name]
      @last_name = attrs[:last_name]
    end
  end

  let(:attribute_test) { AttributeTest.new(first_name: 'Foo', last_name: 'Bar') }

  it '#attributes'do
    assert_equal attribute_test.attributes, Hash['first_name' => 'Foo', 'last_name' => 'Bar']
  end
end