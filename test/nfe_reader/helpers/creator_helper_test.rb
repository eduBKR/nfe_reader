require File.expand_path("../../../test_helper", __FILE__)

describe Nfe::Reader::CreatorHelper do
  class CreatorTest < Struct.new(:name)
    include Nfe::Reader::CreatorHelper
  end

  class ResourceTest < Struct.new(:name)
  end

  let(:creator_test) { CreatorTest.new('Foo') }

  describe '#to_array'do
    it { assert_equal creator_test.to_array([{name: 'Foo'}, {name: 'Bar'}]), [['Foo'], ['Bar']] }
    it { assert_equal creator_test.to_array({name: 'Foo'}), [['Foo']] }
  end

  it '#create_resource'do
   creator_test.create_resource(ResourceTest, 'Foo').must_be_instance_of ResourceTest
  end

  describe '#create_resource'do
    let(:resources) { creator_test.create_resources(ResourceTest, [['Name', 'Foo'], ['Name', 'Bar']]) }

    it { resources.must_be_instance_of Array }
    it { resources.first.must_be_instance_of ResourceTest }
  end
end