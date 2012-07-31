require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'test/unit'
require 'shoulda'
require 'mocha'
require 'rails'

require File.dirname(__FILE__) + '/../lib/easy_class_constants'

require 'easy_class_constants'

class Test::Unit::TestCase
end