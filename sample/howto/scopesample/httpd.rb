#!/usr/bin/env ruby
# encoding: ASCII-8BIT

require 'webrick'
require 'soap/property'

docroot = "."
port = 8808
if opt = SOAP::Property.loadproperty("samplehttpd.conf")
  docroot = opt["docroot"]
  port = Integer(opt["port"])
end

s = WEBrick::HTTPServer.new(
  :BindAddress => "0.0.0.0",
  :Port => port,
  :DocumentRoot => docroot,
  :CGIPathEnv => ENV['PATH']
)
trap(:INT) do
  s.shutdown
end
s.start
