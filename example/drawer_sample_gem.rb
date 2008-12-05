require 'rubygems'
require 'drawer'

cache_file = File.join(File.dirname(__FILE__), 'db/development.yml')

cache = Drawer.new(cache_file)

puts "Store the value 123 in the given key."
puts "=> " + cache.set("foo", 123).inspect

puts "Retrieve the value for the key foo."
puts "=> " + cache.get("foo").inspect

puts "Flush the cache."
puts "=> " + cache.flush_all.inspect

puts "Try to get foo again."
puts "=> " + cache.get("foo").inspect
