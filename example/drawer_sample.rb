require File.join(File.dirname(__FILE__), '../lib/drawer')

cache_file = File.join(File.dirname(__FILE__), 'db/development.yml')

cache = Drawer.new(cache_file)

puts "Store the value 123 in the 'foo' key."
puts "=> " + cache.set("foo", 123).inspect

puts "Store the value 456 in the 'bar' key."
puts "=> " + cache.set("bar", 456).inspect

puts "Retrieve the value for the key 'foo'."
puts "=> " + cache.get("foo").inspect

puts "Retrieve the value for the keys 'foo' and 'bar'."
puts "=> " + cache.get_multi("foo", "bar").inspect

puts "Flush the cache."
puts "=> " + cache.flush_all.inspect

puts "Try to get foo again."
puts "=> " + cache.get("foo").inspect
