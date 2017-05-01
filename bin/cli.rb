$:.unshift(File.dirname(File.expand_path(__FILE__)) + '/../lib/')
require 'utils'

yahoo = Parser::Yahoo.new(9142)
yahoo.parse
