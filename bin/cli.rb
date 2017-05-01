$:.unshift(File.dirname(File.expand_path(__FILE__)) + '/../lib/')
require 'utils'

kyusyu = Lib::Parser::Yahoo.new(9142)
makuro = Lib::Parser::Yahoo.new(3978)
makuro.parse
kyusyu.parse
