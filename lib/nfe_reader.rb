# encoding: UTF-8
require "nfe_reader/version"
require "nokogiri"
require "helpers/nokogiri_hash"
require "helpers/attribute_helper"
require "helpers/creator_helper"

%w(nfe_reader/product nfe_reader/collection nfe_reader/taxation nfe_reader).each do |namespace|
  Dir[File.dirname(__FILE__) + "/../lib/#{namespace}/*.rb"].each { |file| require file }
end