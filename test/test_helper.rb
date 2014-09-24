require 'bundler/setup'
require 'minitest/autorun'

begin
  require 'turn/autorun'
  
  Turn.config.format = :dot
rescue LoadError
  puts 'Install the Turn gem for prettier test output.'
end

$:.unshift File.expand_path("../../lib", __FILE__)
require 'nfe_reader'