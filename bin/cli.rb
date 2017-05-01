$:.unshift(File.dirname(File.expand_path(__FILE__)) + '/../lib/')
require 'utils'

Lib::Fin::Yahoo.current_price(1)
