require File.expand_path("../../test_helper", __FILE__)

describe Nfe::Reader::Nfe do
  let (:nfe) { Nfe::Reader::Nfe.new(File.open(file)) }

  describe 'many products' do 
    let(:file) { File.open(File.expand_path("../../files/sample-nfe.xml", __FILE__))}

    it '#version' do
      nfe.version.must_equal '2.00'
    end

    it '#number' do
      nfe.number.must_equal 'NFe12300384950081649000148500001000001310002342'
    end

    it '#signature' do
      nfe.signature.must_be_instance_of Hash
    end

    it '#customer' do
      nfe.customer.must_be_instance_of Nfe::Reader::Customer
    end

    it '#information' do
      nfe.information.must_be_instance_of Nfe::Reader::Information
    end

    it '#header' do
      nfe.header.must_be_instance_of Nfe::Reader::Header
    end

    it '#provider' do
      nfe.provider.must_be_instance_of Nfe::Reader::Provider
    end

    it '#customer' do
      nfe.customer.must_be_instance_of Nfe::Reader::Customer
    end

    it '#products' do
      nfe.products.must_be_instance_of Array
    end

    it '#products' do
      nfe.products.first.must_be_instance_of Nfe::Reader::Product
    end

    it '#collection' do
      nfe.collection.must_be_instance_of Nfe::Reader::Collection
    end

    it '#transport' do
      nfe.transport.must_be_instance_of Nfe::Reader::Transport
    end

    it '#purchase' do
      nfe.purchase.must_be_nil
    end

    it '#cane' do
      nfe.cane.must_be_nil
    end

    it '#export' do
      nfe.export.must_be_nil
    end

    it '#delivery' do
      nfe.delivery.must_be_nil
    end

    it '#removal' do
      nfe.removal.must_be_nil
    end

    it '#enviroment' do
      nfe.enviroment.must_equal '1'
    end

    it '#version_app' do
      nfe.version_app.must_equal 'SVRS2000101120000'
    end

    it '#key' do
      nfe.key.must_equal '12300384950081649000148500001000001310002342'
    end

    it '#date' do
      nfe.date.must_equal '2000-01-01T12:00:00'
    end

    it '#protocol' do
      nfe.protocol.must_equal '100000481241129'
    end

    it '#digest' do
      nfe.digest.must_equal 'aklOQ0184NjoeaqCIRT01927Crf='
    end

    it '#status' do
      nfe.status.must_equal '100'
    end

    it '#description' do
      nfe.description.must_equal 'Autorizado o uso da NF-e'
    end

    it '#total' do
      nfe.total.must_be_instance_of Nfe::Reader::Total
    end
  end

  describe 'single product' do 
    let(:file) { File.open(File.expand_path("../../files/sample2-nfe.xml", __FILE__))}

    it '#products' do
      nfe.products.must_be_instance_of Array
    end

    it '#products' do
      nfe.products.first.must_be_instance_of Nfe::Reader::Product
    end
  end
end