require File.expand_path("../../test_helper", __FILE__)

describe NfeReader::Nfe do

  let (:nfe) { NfeReader::Base.read(File.open(file)) }

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
      nfe.customer.must_be_instance_of NfeReader::Customer
    end

    it '#information' do
      nfe.information.must_be_instance_of NfeReader::Information
    end

    it '#header' do
      nfe.header.must_be_instance_of NfeReader::Header
    end

    it '#provider' do
      nfe.provider.must_be_instance_of NfeReader::Provider
    end

    it '#customer' do
      nfe.customer.must_be_instance_of NfeReader::Customer
    end

    it '#products' do
      nfe.products.must_be_instance_of Array
    end

    it '#products' do
      nfe.products.first.must_be_instance_of NfeReader::Product
    end

    it '#billing' do
      nfe.billing.must_be_instance_of NfeReader::Billing
    end

    it '#transport' do
      nfe.transport.must_be_instance_of NfeReader::Transport
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

    it '#protocol' do
      nfe.protocol.must_be_instance_of NfeReader::Protocol
    end


    it '#total' do
      nfe.total.must_be_instance_of NfeReader::Total
    end
  end

  describe 'single product' do 
    let(:file) { File.open(File.expand_path("../../files/sample2-nfe.xml", __FILE__))}

    it '#products' do
      nfe.products.must_be_instance_of Array
    end

    it '#products' do
      nfe.products.first.must_be_instance_of NfeReader::Product
    end
  end
end