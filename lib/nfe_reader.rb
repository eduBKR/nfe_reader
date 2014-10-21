# encoding: UTF-8
require "nfe_reader/version"
require "nokogiri"
require "nfe_reader/helpers/nokogiri_hash"
require "nfe_reader/helpers/attribute_helper"
require "nfe_reader/helpers/creator_helper"

%w(nfe_reader/product nfe_reader/billing nfe_reader/taxation nfe_reader).each do |namespace|
  Dir[File.dirname(__FILE__) + "/../lib/#{namespace}/*.rb"].each { |file| require file }
end