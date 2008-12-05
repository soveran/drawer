require 'rubygems'
require 'drawer'

IRB.conf[:IRB_RC] = lambda do
  system 'clear'
end

irb Drawer.new(ENV['DRAWER'])
